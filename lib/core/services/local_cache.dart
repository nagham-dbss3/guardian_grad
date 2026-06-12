import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/guardian_prefs.dart';
import '../../models/notification_item.dart';
import '../../models/patient_record.dart';
import '../../models/child.dart';

/// Offline-first cache backed by Hive. Models are stored as JSON strings
/// (json_serializable) rather than typed adapters, which keeps the dependency
/// graph light and avoids hive_generator.
class LocalCache {
  LocalCache._();
  static final LocalCache instance = LocalCache._();

  static const _boxName = 'basma_cache';
  static const _kGuardian = 'guardian';
  static const _kRecords = 'records'; // Map<fileNo, recordJson>
  static const _kNotifications = 'notifications';
  static const _kPrefs = 'prefs';
  static const _kActiveChild = 'activeChild';
  static const _kLoggedIn = 'loggedIn';

  late Box _box;
  bool _ready = false;

  Future<void> init() async {
    if (_ready) return;
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    _ready = true;
  }

  bool get hasData => _box.containsKey(_kRecords);

  // ---- Auth flag ----------------------------------------------------------

  bool get isLoggedIn => _box.get(_kLoggedIn, defaultValue: false) as bool;
  Future<void> setLoggedIn(bool value) => _box.put(_kLoggedIn, value);

  // ---- Guardian -----------------------------------------------------------

  Future<void> saveGuardian(GuardianProfile guardian) =>
      _box.put(_kGuardian, jsonEncode(guardian.toJson()));

  GuardianProfile? loadGuardian() {
    final raw = _box.get(_kGuardian) as String?;
    if (raw == null) return null;
    return GuardianProfile.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
  }

  // ---- Records (per child) ------------------------------------------------

  Future<void> saveRecords(Map<String, PatientRecord> records) {
    final encoded = records.map(
      (key, value) => MapEntry(key, value.toJson()),
    );
    return _box.put(_kRecords, jsonEncode(encoded));
  }

  Map<String, PatientRecord> loadRecords() {
    final raw = _box.get(_kRecords) as String?;
    if (raw == null) return {};
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map(
      (key, value) => MapEntry(
        key,
        PatientRecord.fromJson(value as Map<String, dynamic>),
      ),
    );
  }

  Future<void> saveRecord(String fileNo, PatientRecord record) async {
    final all = loadRecords();
    all[fileNo] = record;
    await saveRecords(all);
  }

  // ---- Active child -------------------------------------------------------

  String? get activeChild => _box.get(_kActiveChild) as String?;
  Future<void> setActiveChild(String fileNo) =>
      _box.put(_kActiveChild, fileNo);

  // ---- Notifications ------------------------------------------------------

  Future<void> saveNotifications(List<NotificationItem> items) {
    final list = items.map((e) => e.toJson()).toList();
    return _box.put(_kNotifications, jsonEncode(list));
  }

  List<NotificationItem> loadNotifications() {
    final raw = _box.get(_kNotifications) as String?;
    if (raw == null) return [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ---- Prefs --------------------------------------------------------------

  Future<void> savePrefs(GuardianPrefs prefs) =>
      _box.put(_kPrefs, jsonEncode(prefs.toJson()));

  GuardianPrefs loadPrefs() {
    final raw = _box.get(_kPrefs) as String?;
    if (raw == null) return const GuardianPrefs();
    return GuardianPrefs.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> clear() => _box.clear();
}
