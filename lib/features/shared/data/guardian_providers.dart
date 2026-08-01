import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/local_cache.dart';
import '../../../core/services/notification_service.dart';
import '../../../models/checkin.dart';
import '../../../models/child.dart';
import '../../../models/clinical.dart';
import '../../../models/guardian_prefs.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';
import '../../../models/treatment.dart';
import 'guardian_repository.dart';

final localCacheProvider = Provider<LocalCache>((ref) => LocalCache.instance);

final guardianRepositoryProvider = Provider<GuardianRepository>(
  (ref) => GuardianRepository(ref.watch(localCacheProvider)),
);

/// Immutable snapshot of everything the UI reads.
class GuardianState {
  const GuardianState({
    required this.guardian,
    required this.activeFileNo,
    required this.record,
    required this.notifications,
    required this.prefs,
  });

  final GuardianProfile guardian;
  final String activeFileNo;
  final PatientRecord record;
  final List<NotificationItem> notifications;
  final GuardianPrefs prefs;

  int get unreadNotifications => notifications.where((n) => !n.isRead).length;

  /// Prefer the live guardian children list (API) over the nested record copy.
  ChildSummary get activeChild {
    for (final c in guardian.children) {
      if (c.fileNoBasma == activeFileNo) return c;
    }
    return record.child;
  }
}

class GuardianController extends Notifier<GuardianState> {
  GuardianRepository get _repo => ref.read(guardianRepositoryProvider);

  @override
  GuardianState build() => _snapshot();

  GuardianState _snapshot() => GuardianState(
        guardian: _repo.guardian(),
        activeFileNo: _repo.activeChildFileNo(),
        record: _repo.activeRecord(),
        notifications: _repo.notifications(),
        prefs: _repo.prefs(),
      );

  void refresh() => state = _snapshot();

  Future<void> _applyDoseReminders() async {
    await NotificationService.instance.rescheduleDoseReminders(
      state.record,
      enabled: state.prefs.doseReminders,
    );
  }

  /// Fetch `GET /guardian/me` + clinical for all children, replace cache, refresh UI.
  Future<void> syncProfile({bool clearFirst = false}) async {
    await _repo.syncProfile(clearFirst: clearFirst);
    await _repo.syncNotifications();
    refresh();
    await _applyDoseReminders();
    await NotificationService.instance.syncDeviceTokenToServer();
  }

  /// Fetch inbox from `GET /guardian/notifications`.
  Future<void> syncNotifications() async {
    await _repo.syncNotifications();
    refresh();
  }

  /// Fetch `GET /guardian/children` (profile open / switcher refresh).
  Future<void> syncChildren() async {
    await _repo.syncChildren();
    refresh();
  }

  /// Persist active child, refresh clinical for that child, update UI + reminders.
  Future<void> switchChild(String fileNo) async {
    await _repo.setActiveChild(fileNo);
    await _repo.syncChildren();
    await _repo.syncClinicalForChild(fileNo);
    refresh();
    await _applyDoseReminders();
  }

  /// Re-fetch clinical endpoints for the active child (incl. discharge + dose).
  Future<void> syncActiveClinical() async {
    await _repo.syncActiveClinical();
    refresh();
    await _applyDoseReminders();
  }

  Future<void> clearSessionCache() async {
    await NotificationService.instance.unregisterDeviceTokenFromServer();
    await _repo.clearSessionCache();
    refresh();
    await NotificationService.instance.rescheduleDoseReminders(
      state.record,
      enabled: false,
    );
  }

  Future<void> markNotificationRead(String id) async {
    await _repo.markNotificationRead(id);
    refresh();
  }

  Future<void> markAllNotificationsRead() async {
    await _repo.markAllNotificationsRead();
    refresh();
  }

  Future<void> markResultRead(String resultId) async {
    await _repo.markResultRead(resultId);
    refresh();
  }

  /// Downloads lab-result PDF bytes from the API.
  Future<Uint8List> downloadLabResultPdf(String resultId) =>
      _repo.downloadLabResultPdf(resultId);

  Future<void> updatePrefs(GuardianPrefs prefs) async {
    await _repo.savePrefs(prefs);
    refresh();
    await _applyDoseReminders();
  }
}

final guardianControllerProvider =
    NotifierProvider<GuardianController, GuardianState>(
  GuardianController.new,
);

/// Guardian profile from the latest API/Hive snapshot.
final guardianProfileProvider = Provider<GuardianProfile>(
  (ref) => ref.watch(guardianControllerProvider).guardian,
);

/// Active child from API children + persisted file number.
final activeChildProvider = Provider<ChildSummary>(
  (ref) => ref.watch(guardianControllerProvider).activeChild,
);

final activeRecordProvider = Provider<PatientRecord>(
  (ref) => ref.watch(guardianControllerProvider).record,
);

/// Treatment journey for the active child (from API cache).
final treatmentJourneyProvider = Provider<TreatmentPlanView>(
  (ref) => ref.watch(activeRecordProvider).treatmentPlan,
);

/// Lab results for the active child (from API cache; may be empty).
final labResultsProvider = Provider<List<LabResultView>>(
  (ref) => ref.watch(activeRecordProvider).labResults,
);

/// Discharge reports for the active child (from API cache; may be empty).
final dischargeReportsProvider = Provider<List<DischargeReportView>>(
  (ref) => ref.watch(activeRecordProvider).dischargeReports,
);

/// Dedicated dose-reminder payload for the active child (may be null).
final doseReminderProvider = Provider<DoseReminderModel?>(
  (ref) => ref.watch(activeRecordProvider).doseReminder,
);

/// Resolved next dose date (API reminder, else latest discharge).
final nextDoseDateProvider = Provider<DateTime?>(
  (ref) => ref.watch(activeRecordProvider).nextDoseDate,
);

/// Check-in / queue token for the active child (may be null / hidden).
final checkInTokenProvider = Provider<CheckInToken?>((ref) {
  final token = ref.watch(activeRecordProvider).checkInToken;
  if (token == null || !token.visibleToGuardian) return null;
  return token;
});

/// Upcoming appointments for the active child (may be empty).
final appointmentsProvider = Provider<List<AppointmentView>>(
  (ref) => ref.watch(activeRecordProvider).appointments,
);

final unreadNotificationsProvider = Provider<int>(
  (ref) => ref.watch(
    guardianControllerProvider.select((s) => s.unreadNotifications),
  ),
);
