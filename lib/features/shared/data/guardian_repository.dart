import '../../../core/services/local_cache.dart';
import '../../../mock/mock_data.dart';
import '../../../models/child.dart';
import '../../../models/clinical.dart';
import '../../../models/guardian_prefs.dart';
import '../../../models/notification_item.dart';
import '../../../models/patient_record.dart';

/// Offline-first repository. Reads from the Hive cache first; seeds the cache
/// from mock data on first launch so everything is available offline.
class GuardianRepository {
  GuardianRepository(this._cache);
  final LocalCache _cache;

  /// Seed cache once, then always serve from cache.
  Future<void> ensureSeeded() async {
    if (_cache.hasData) return;
    await _cache.saveGuardian(MockData.guardian());
    await _cache.saveRecords(MockData.records());
    await _cache.saveNotifications(MockData.notifications());
    await _cache.savePrefs(const GuardianPrefs());
    final first = MockData.guardian().children.first.fileNoBasma;
    await _cache.setActiveChild(first);
  }

  GuardianProfile guardian() => _cache.loadGuardian() ?? MockData.guardian();

  Map<String, PatientRecord> records() {
    final cached = _cache.loadRecords();
    return cached.isEmpty ? MockData.records() : cached;
  }

  String activeChildFileNo() =>
      _cache.activeChild ?? guardian().children.first.fileNoBasma;

  PatientRecord activeRecord() {
    final all = records();
    final active = activeChildFileNo();
    return all[active] ?? all.values.first;
  }

  Future<void> setActiveChild(String fileNo) => _cache.setActiveChild(fileNo);

  List<NotificationItem> notifications() {
    final list = _cache.loadNotifications();
    list.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return list;
  }

  GuardianPrefs prefs() => _cache.loadPrefs();
  Future<void> savePrefs(GuardianPrefs prefs) => _cache.savePrefs(prefs);

  // ---- Mutations (local writes only) --------------------------------------

  Future<void> markNotificationRead(String id) async {
    final updated = _cache
        .loadNotifications()
        .map((n) => n.id == id ? n.copyWith(isRead: true) : n)
        .toList();
    await _cache.saveNotifications(updated);
  }

  Future<void> markAllNotificationsRead() async {
    final updated = _cache
        .loadNotifications()
        .map((n) => n.copyWith(isRead: true))
        .toList();
    await _cache.saveNotifications(updated);
  }

  Future<void> markResultRead(String resultId) async {
    final all = _cache.loadRecords();
    final fileNo = activeChildFileNo();
    final record = all[fileNo];
    if (record == null) return;
    final updatedResults = record.labResults
        .map((r) => r.id == resultId ? r.copyWith(isRead: true) : r)
        .toList();
    all[fileNo] = record.copyWith(labResults: updatedResults);
    await _cache.saveRecords(all);
  }

  /// Dev/mock trigger: simulate a new lab result arriving for the active child.
  /// Marks the result list with a fresh unread item and adds a notification.
  /// Returns the new result so the caller can fire a local notification.
  Future<LabResultView> simulateResultArrived() async {
    final all = _cache.loadRecords();
    final fileNo = activeChildFileNo();
    final record = all[fileNo]!;
    final now = DateTime.now();
    final newResult = LabResultView(
      id: 'LR-${now.millisecondsSinceEpoch}',
      testType: 'تحليل جديد (محاكاة)',
      resultDate: now,
      status: 'مكتملة',
      pdfPath: 'mock_new',
      isRead: false,
      summary: 'نتيجة محاكاة لعرض تدفّق إشعار وصول النتائج.',
    );
    all[fileNo] = record.copyWith(
      labResults: [newResult, ...record.labResults],
      lastUpdated: now,
    );
    await _cache.saveRecords(all);

    final notif = NotificationItem(
      id: 'N-${now.millisecondsSinceEpoch}',
      type: AppNotificationType.resultArrived,
      message: 'وصلت نتيجة جديدة: ${newResult.testType}.',
      timestamp: now,
      relatedId: newResult.id,
      deepLink: '/results/${newResult.id}',
    );
    await _cache.saveNotifications([notif, ..._cache.loadNotifications()]);
    return newResult;
  }
}
