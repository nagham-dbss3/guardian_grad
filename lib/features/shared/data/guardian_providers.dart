import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/local_cache.dart';
import '../../../models/child.dart';
import '../../../models/guardian_prefs.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';
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

  ChildSummary get activeChild => record.child;
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

  Future<void> switchChild(String fileNo) async {
    await _repo.setActiveChild(fileNo);
    refresh();
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

  Future<void> updatePrefs(GuardianPrefs prefs) async {
    await _repo.savePrefs(prefs);
    refresh();
  }

  /// Returns the new result id so the caller can deep-link / notify.
  Future<String> simulateResultArrived() async {
    final result = await _repo.simulateResultArrived();
    refresh();
    return result.id;
  }
}

final guardianControllerProvider =
    NotifierProvider<GuardianController, GuardianState>(
  GuardianController.new,
);

/// Convenience selectors.
final activeRecordProvider = Provider<PatientRecord>(
  (ref) => ref.watch(guardianControllerProvider).record,
);

final unreadNotificationsProvider = Provider<int>(
  (ref) => ref.watch(
    guardianControllerProvider.select((s) => s.unreadNotifications),
  ),
);
