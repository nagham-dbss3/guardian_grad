import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../models/guardian_prefs.dart';
import '../../models/notification_item.dart';
import '../../models/patient_record.dart';
import '../../models/child.dart';
import '../../models/user.dart';

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
  static const _kAuthUser = 'authUser';
  static const _kAuthToken = 'authToken';
  static const _kFcmToken = 'fcmToken';

  late Box _box;
  bool _ready = false;

  Future<void> init() async {
    if (_ready) return;
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
    _ready = true;
  }

  bool get hasData => _box.containsKey(_kRecords);
  bool get hasGuardian => _box.containsKey(_kGuardian);

  // ---- Auth flag / session user -------------------------------------------

  bool get isLoggedIn => _box.get(_kLoggedIn, defaultValue: false) as bool;
  Future<void> setLoggedIn(bool value) => _box.put(_kLoggedIn, value);

  Future<void> saveAuthUser(UserModel user) =>
      _box.put(_kAuthUser, jsonEncode(user.toJson()));

  UserModel? loadAuthUser() {
    final raw = _box.get(_kAuthUser) as String?;
    if (raw == null) return null;
    return UserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> clearAuthUser() => _box.delete(_kAuthUser);

  Future<void> saveAuthToken(String token) => _box.put(_kAuthToken, token);

  String? loadAuthToken() => _box.get(_kAuthToken) as String?;

  Future<void> clearAuthToken() => _box.delete(_kAuthToken);

  // ---- Guardian -----------------------------------------------------------

  Future<void> saveGuardian(GuardianProfile guardian) {
    final map = Map<String, dynamic>.from(guardian.toJson());
    // Always persist children as plain maps (never Freezed instances).
    map['children'] = guardian.children.map((c) => c.toJson()).toList();
    return _box.put(_kGuardian, jsonEncode(map));
  }

  GuardianProfile? loadGuardian() {
    final raw = _box.get(_kGuardian) as String?;
    if (raw == null) return null;
    try {
      return GuardianProfile.fromJson(
        jsonDecode(raw) as Map<String, dynamic>,
      );
    } catch (e) {
      // Corrupt / legacy mock payload — treat as missing.
      return null;
    }
  }

  Future<void> clearGuardian() => _box.delete(_kGuardian);

  // ---- Records (per child) ------------------------------------------------

  Future<void> saveRecords(Map<String, PatientRecord> records) {
    final encoded = <String, dynamic>{};
    for (final entry in records.entries) {
      final map = Map<String, dynamic>.from(entry.value.toJson());
      map['child'] = entry.value.child.toJson();
      encoded[entry.key] = map;
    }
    return _box.put(_kRecords, jsonEncode(encoded));
  }

  Map<String, PatientRecord> loadRecords() {
    final raw = _box.get(_kRecords) as String?;
    if (raw == null) return {};
    try {
      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      return decoded.map(
        (key, value) => MapEntry(
          key,
          PatientRecord.fromJson(value as Map<String, dynamic>),
        ),
      );
    } catch (_) {
      return {};
    }
  }

  Future<void> saveRecord(String fileNo, PatientRecord record) async {
    final all = loadRecords();
    all[fileNo] = record;
    await saveRecords(all);
  }

  Future<void> clearRecords() => _box.delete(_kRecords);

  // ---- Active child -------------------------------------------------------

  String? get activeChild => _box.get(_kActiveChild) as String?;
  Future<void> setActiveChild(String fileNo) =>
      _box.put(_kActiveChild, fileNo);

  Future<void> clearActiveChild() => _box.delete(_kActiveChild);

  // ---- Notifications ------------------------------------------------------

  Future<void> saveNotifications(List<NotificationItem> items) {
    final list = items.map((e) => e.toJson()).toList();
    return _box.put(_kNotifications, jsonEncode(list));
  }

  List<NotificationItem> loadNotifications() {
    final raw = _box.get(_kNotifications) as String?;
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Inserts or replaces a single inbox item (newest first).
  Future<void> upsertNotification(NotificationItem item) async {
    final list = loadNotifications().where((n) => n.id != item.id).toList();
    await saveNotifications([item, ...list]);
  }

  Future<void> clearNotifications() => _box.delete(_kNotifications);

  // ---- FCM device token (last registered) ---------------------------------

  Future<void> saveFcmToken(String token) => _box.put(_kFcmToken, token);

  String? loadFcmToken() => _box.get(_kFcmToken) as String?;

  Future<void> clearFcmToken() => _box.delete(_kFcmToken);

  // ---- Prefs --------------------------------------------------------------

  Future<void> savePrefs(GuardianPrefs prefs) =>
      _box.put(_kPrefs, jsonEncode(prefs.toJson()));

  GuardianPrefs loadPrefs() {
    final raw = _box.get(_kPrefs) as String?;
    if (raw == null) return const GuardianPrefs();
    try {
      return GuardianPrefs.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return const GuardianPrefs();
    }
  }

  /// Drops mock/API guardian identity + clinical cache. Keeps prefs + auth keys.
  Future<void> clearGuardianSessionData() async {
    await clearGuardian();
    await clearRecords();
    await clearNotifications();
    await clearActiveChild();
  }

  Future<void> clear() => _box.clear();
}
