import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/local_cache.dart';
import '../../../models/child.dart';
import '../../../models/guardian_prefs.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';
import '../../../models/treatment.dart';
import 'guardian_remote_source.dart';

/// Offline-first repository. Guardian identity, children, treatment journey,
/// and lab results come from the API and are cached in Hive for offline use.
class GuardianRepository {
  GuardianRepository(this._cache) : _remote = GuardianRemoteSource();

  final LocalCache _cache;
  final GuardianRemoteSource _remote;

  static const _emptyGuardian = GuardianProfile(
    id: '',
    name: '',
    relationshipToChild: '',
  );

  /// Ensures prefs exist and drops any leftover mock cache from older builds.
  Future<void> ensureSeeded() async {
    await _purgeLegacyMockIfPresent();
    await _cache.savePrefs(_cache.loadPrefs());
  }

  Future<void> _purgeLegacyMockIfPresent() async {
    final g = _cache.loadGuardian();
    final records = _cache.loadRecords();
    final isLegacy = (g != null &&
            (g.id == 'G-001' ||
                g.name.contains('أم يوسف') ||
                g.children.any((c) => c.fileNoBasma.startsWith('BSM-')))) ||
        records.keys.any((k) => k.startsWith('BSM-'));
    if (isLegacy) {
      debugPrint('Clearing leftover mock cache');
      await clearSessionCache();
    }
  }

  /// Clears guardian/children/records so a new login cannot mix with old data.
  Future<void> clearSessionCache() => _cache.clearGuardianSessionData();

  GuardianProfile guardian() => _cache.loadGuardian() ?? _emptyGuardian;

  Map<String, PatientRecord> records() => _cache.loadRecords();

  String activeChildFileNo() {
    final children = guardian().children;
    if (children.isEmpty) return _cache.activeChild ?? '';
    final saved = _cache.activeChild;
    if (saved != null && children.any((c) => c.fileNoBasma == saved)) {
      return saved;
    }
    return children.first.fileNoBasma;
  }

  PatientRecord activeRecord() {
    final all = records();
    final active = activeChildFileNo();
    final existing = all[active];
    if (existing != null) {
      // Always overlay the API child identity onto the cached clinical record.
      final apiChild = _childByFileNo(active);
      if (apiChild != null && existing.child != apiChild) {
        return existing.copyWith(child: apiChild);
      }
      return existing;
    }

    final child = _childByFileNo(active) ??
        (guardian().children.isNotEmpty ? guardian().children.first : null);
    if (child != null) return _emptyRecord(child);

    return _emptyRecord(
      const ChildSummary(
        fileNoBasma: '',
        firstName: '',
        familyName: '',
        age: 0,
        gender: '',
        currentPhase: '',
      ),
    );
  }

  ChildSummary? _childByFileNo(String fileNo) {
    for (final c in guardian().children) {
      if (c.fileNoBasma == fileNo) return c;
    }
    return null;
  }

  Future<void> setActiveChild(String fileNo) => _cache.setActiveChild(fileNo);

  /// `GET /guardian/me` → replace local guardian + children + clinical for each child.
  Future<GuardianProfile> syncProfile({bool clearFirst = false}) async {
    try {
      if (clearFirst) {
        await clearSessionCache();
      }
      final profile = await _remote.fetchMe();
      await _persistGuardian(profile, forceFirstActive: clearFirst);
      await syncClinicalForChildren(
        profile.children.map((c) => c.fileNoBasma),
      );
      debugPrint(
        'syncProfile applied — ${profile.name} / '
        '${profile.children.map((c) => "${c.firstName}(${c.fileNoBasma})").join(", ")}',
      );
      return profile;
    } on DioException catch (e) {
      debugPrint('syncProfile failed — keeping cache: $e');
      return guardian();
    } catch (e) {
      debugPrint('syncProfile failed — keeping cache: $e');
      return guardian();
    }
  }

  /// `GET /guardian/children` → refresh children on the cached profile.
  Future<List<ChildSummary>> syncChildren() async {
    try {
      final children = await _remote.fetchChildren();
      final current = guardian();
      // If we have no real profile yet, fetch full /me instead.
      if (current.id.isEmpty) {
        await syncProfile();
        return guardian().children;
      }
      final updated = current.copyWith(children: children);
      await _persistGuardian(updated, forceFirstActive: false);
      return children;
    } on DioException catch (e) {
      debugPrint('syncChildren failed — keeping cache: $e');
      return guardian().children;
    } catch (e) {
      debugPrint('syncChildren failed — keeping cache: $e');
      return guardian().children;
    }
  }

  /// Prefer full record bundle; fall back to granular endpoints if needed.
  Future<void> syncClinicalForChild(String fileNo) async {
    if (fileNo.isEmpty) return;
    final child = _childByFileNo(fileNo);
    if (child == null) return;

    final previous = records()[fileNo] ?? _emptyRecord(child);

    try {
      var record = await _remote.fetchChildRecord(fileNo);
      // Keep guardian-list identity if API child is thinner; keep dose if absent.
      record = record.copyWith(
        child: record.child.fileNoBasma.isNotEmpty ? record.child : child,
        doseReminder: record.doseReminder ?? previous.doseReminder,
      );

      try {
        final reminder = await _remote.fetchDoseReminder(fileNo);
        record = record.copyWith(doseReminder: reminder);
      } on DioException catch (e) {
        debugPrint('dose-reminder offline/error for $fileNo: $e');
      } catch (e) {
        debugPrint('dose-reminder parse error for $fileNo: $e');
      }

      await _cache.saveRecord(fileNo, record);
      return;
    } on DioException catch (e) {
      debugPrint('record bundle offline/error for $fileNo: $e — granular sync');
    } catch (e) {
      debugPrint('record bundle parse error for $fileNo: $e — granular sync');
    }

    await _syncClinicalGranular(fileNo, previous.copyWith(child: child));
  }

  /// Legacy per-endpoint clinical sync (used when /record is unavailable).
  Future<void> _syncClinicalGranular(
    String fileNo,
    PatientRecord seed,
  ) async {
    var record = seed;

    try {
      final plan = await _remote.fetchTreatmentJourney(fileNo);
      record = record.copyWith(
        treatmentPlan: plan,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('treatment-journey offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('treatment-journey parse error for $fileNo: $e');
    }

    try {
      final labs = await _remote.fetchLabResults(fileNo);
      record = record.copyWith(
        labResults: labs,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('lab-results offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('lab-results parse error for $fileNo: $e');
    }

    try {
      final reports = await _remote.fetchDischargeReports(fileNo);
      record = record.copyWith(
        dischargeReports: reports,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('discharge-reports offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('discharge-reports parse error for $fileNo: $e');
    }

    try {
      final reminder = await _remote.fetchDoseReminder(fileNo);
      record = record.copyWith(
        doseReminder: reminder,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('dose-reminder offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('dose-reminder parse error for $fileNo: $e');
    }

    try {
      final token = await _remote.fetchCheckInToken(fileNo);
      record = record.copyWith(
        checkInToken: token,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('check-in-token offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('check-in-token parse error for $fileNo: $e');
    }

    try {
      final appointments = await _remote.fetchAppointments(fileNo);
      record = record.copyWith(
        appointments: appointments,
        lastUpdated: DateTime.now(),
      );
    } on DioException catch (e) {
      debugPrint('appointments offline/error for $fileNo: $e');
    } catch (e) {
      debugPrint('appointments parse error for $fileNo: $e');
    }

    await _cache.saveRecord(fileNo, record);
  }

  /// Parallel clinical sync for several children (best-effort).
  Future<void> syncClinicalForChildren(Iterable<String> fileNos) async {
    final unique = fileNos.where((f) => f.isNotEmpty).toSet();
    if (unique.isEmpty) return;
    await Future.wait(unique.map(syncClinicalForChild));
  }

  /// Sync clinical data for the currently active child.
  Future<void> syncActiveClinical() async {
    final fileNo = activeChildFileNo();
    if (fileNo.isEmpty) return;
    await syncClinicalForChild(fileNo);
  }

  Future<void> _persistGuardian(
    GuardianProfile profile, {
    required bool forceFirstActive,
  }) async {
    await _cache.saveGuardian(profile);
    await _alignRecordsWithChildren(profile.children);

    if (profile.children.isEmpty) {
      await _cache.clearActiveChild();
      return;
    }

    final saved = _cache.activeChild;
    final stillValid = saved != null &&
        profile.children.any((c) => c.fileNoBasma == saved);

    if (forceFirstActive || !stillValid) {
      await _cache.setActiveChild(profile.children.first.fileNoBasma);
    }

    debugPrint(
      'Guardian cached — active=${_cache.activeChild}, '
      'children=${profile.children.map((c) => c.fileNoBasma).join(",")}',
    );
  }

  /// Build/replace clinical records keyed by real API file numbers.
  Future<void> _alignRecordsWithChildren(List<ChildSummary> children) async {
    if (children.isEmpty) {
      await _cache.clearRecords();
      return;
    }

    final existing = Map<String, PatientRecord>.from(_cache.loadRecords());
    // Drop any leftover mock keys so they cannot shadow API children.
    existing.removeWhere((key, _) => key.startsWith('BSM-'));

    final byFile = <String, PatientRecord>{};
    for (final child in children) {
      final match = existing[child.fileNoBasma];
      if (match != null) {
        byFile[child.fileNoBasma] = match.copyWith(child: child);
      } else {
        byFile[child.fileNoBasma] = _emptyRecord(child);
      }
    }

    await _cache.saveRecords(byFile);
  }

  PatientRecord _emptyRecord(ChildSummary child) => PatientRecord(
        child: child,
        diseaseOverview: const DiseaseOverview(
          summary: 'سيتم عرض تفاصيل الحالة قريبًا.',
        ),
        treatmentPlan: const TreatmentPlanView(planName: ''),
        lastUpdated: DateTime.now(),
      );

  List<NotificationItem> notifications() {
    final list = _cache.loadNotifications();
    list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return list;
  }

  GuardianPrefs prefs() => _cache.loadPrefs();
  Future<void> savePrefs(GuardianPrefs prefs) => _cache.savePrefs(prefs);

  // ---- Notifications (API + Hive) -----------------------------------------

  /// `GET /guardian/notifications` → merge with Hive (keeps local FCM rows).
  Future<List<NotificationItem>> syncNotifications() async {
    try {
      final remote = await _remote.fetchNotifications();
      final merged = _mergeInbox(remote, _cache.loadNotifications());
      await _cache.saveNotifications(merged);
      return notifications();
    } on DioException catch (e) {
      debugPrint('notifications offline/error — keeping cache: $e');
      return notifications();
    } catch (e) {
      debugPrint('notifications parse error — keeping cache: $e');
      return notifications();
    }
  }

  /// Persist a push so it appears in the notifications tab immediately.
  Future<void> upsertPushNotification(NotificationItem item) async {
    await _cache.upsertNotification(item);
  }

  /// Keep server inbox + any local FCM-only rows not yet returned by the API.
  List<NotificationItem> _mergeInbox(
    List<NotificationItem> remote,
    List<NotificationItem> local,
  ) {
    final remoteIds = remote.map((n) => n.id).toSet();
    final localOnly = local.where(
      (n) =>
          !remoteIds.contains(n.id) && isLocalPushNotificationId(n.id),
    );
    final merged = [...remote, ...localOnly];
    merged.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return merged;
  }

  /// `POST /guardian/device-tokens`
  Future<void> registerDeviceToken({
    required String fcmToken,
    required String platform,
  }) async {
    await _remote.registerDeviceToken(
      fcmToken: fcmToken,
      platform: platform,
    );
    await _cache.saveFcmToken(fcmToken);
  }

  /// `DELETE /guardian/device-tokens`
  Future<void> unregisterDeviceToken({required String fcmToken}) async {
    await _remote.unregisterDeviceToken(fcmToken: fcmToken);
    await _cache.clearFcmToken();
  }

  Future<void> markNotificationRead(String id) async {
    try {
      await _remote.markNotificationRead(id);
    } on DioException catch (e) {
      debugPrint('mark notification read offline/error: $e');
    } catch (e) {
      debugPrint('mark notification read failed: $e');
    }
    final updated = _cache
        .loadNotifications()
        .map((n) => n.id == id ? n.copyWith(isRead: true) : n)
        .toList();
    await _cache.saveNotifications(updated);
  }

  Future<void> markAllNotificationsRead() async {
    try {
      await _remote.markAllNotificationsRead();
    } on DioException catch (e) {
      debugPrint('mark all notifications read offline/error: $e');
    } catch (e) {
      debugPrint('mark all notifications read failed: $e');
    }
    final updated = _cache
        .loadNotifications()
        .map((n) => n.copyWith(isRead: true))
        .toList();
    await _cache.saveNotifications(updated);
  }

  /// Marks a lab result as read on the server, then updates Hive + UI state.
  Future<void> markResultRead(String resultId) async {
    final fileNo = activeChildFileNo();
    if (fileNo.isEmpty || resultId.isEmpty) return;

    final all = _cache.loadRecords();
    final record = all[fileNo];
    if (record == null) return;

    final current = record.labResults.where((r) => r.id == resultId);
    if (current.isNotEmpty && current.first.isRead) return;

    try {
      await _remote.markLabResultRead(fileNo, resultId);
    } on DioException catch (e) {
      debugPrint('mark lab-result read offline/error: $e');
      // Still mark locally so the UI reflects the guardian opened it.
    } catch (e) {
      debugPrint('mark lab-result read failed: $e');
    }

    final updatedResults = record.labResults
        .map((r) => r.id == resultId ? r.copyWith(isRead: true) : r)
        .toList();
    all[fileNo] = record.copyWith(
      labResults: updatedResults,
      lastUpdated: DateTime.now(),
    );
    await _cache.saveRecords(all);
  }

  /// Downloads the official lab-result PDF from the API.
  Future<Uint8List> downloadLabResultPdf(String resultId) async {
    final fileNo = activeChildFileNo();
    if (fileNo.isEmpty || resultId.isEmpty) {
      throw StateError('Missing child or result id for PDF download');
    }
    return _remote.downloadLabResultPdf(fileNo, resultId);
  }
}
