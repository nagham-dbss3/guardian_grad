import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../../models/notification_item.dart';
import '../../models/patient_record.dart';
import 'fcm_service.dart';
import 'local_cache.dart';
import 'push_inbox_mapper.dart';

/// Façade over FCM (push) + flutter_local_notifications (local + scheduled).
///
/// Device-token sync with the backend is done via [registerDeviceToken] /
/// [unregisterDeviceToken] callbacks wired from the data layer.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  late final FcmService _fcm = FcmService(
    onMessage: _handleFcmForeground,
    onMessageOpened: _handleFcmOpened,
    onTokenRefresh: _handleTokenRefresh,
  );

  /// Set by the router so taps navigate to the right screen.
  void Function(String route)? onDeepLink;

  /// Register FCM token with `POST /guardian/device-tokens`.
  Future<void> Function(String fcmToken, String platform)? registerDeviceToken;

  /// Unregister FCM token with `DELETE /guardian/device-tokens`.
  Future<void> Function(String fcmToken)? unregisterDeviceToken;

  /// Optional: refresh inbox after a foreground push (API sync).
  Future<void> Function()? onInboxRefresh;

  /// Persist an FCM push into the local notifications inbox (Hive).
  Future<void> Function(NotificationItem item)? onPushReceived;

  static const _channelId = 'basma_care';
  static const _channelName = 'تذكيرات بسمة';
  static const _resultsChannelId = 'basma_results';

  bool _ready = false;
  bool _syncingToken = false;

  Future<void> init() async {
    if (_ready) return;
    tzdata.initializeTimeZones();
    _setLocalTimezone();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _local.initialize(
      settings: const InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      ),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload != null && payload.isNotEmpty) onDeepLink?.call(payload);
      },
    );

    await _createChannels();
    await _fcm.init();
    _ready = true;
  }

  String? get fcmToken => _fcm.token ?? LocalCache.instance.loadFcmToken();
  bool get pushAvailable => _fcm.available;

  String get _platform {
    if (kIsWeb) return 'web';
    if (Platform.isIOS) return 'ios';
    if (Platform.isAndroid) return 'android';
    return 'android';
  }

  /// Fetch current FCM token (if any) and register it with the backend.
  Future<void> syncDeviceTokenToServer() async {
    if (registerDeviceToken == null) return;
    if (_syncingToken) return;
    _syncingToken = true;
    try {
      final token =
          await _fcm.refreshToken() ?? LocalCache.instance.loadFcmToken();
      if (token == null || token.isEmpty) {
        debugPrint('FCM: no token to register');
        return;
      }
      debugPrint('Registering FCM token with backend ($_platform)...');
      debugPrint('FCM TOKEN → $token');
      await LocalCache.instance.saveFcmToken(token);
      await registerDeviceToken!(token, _platform);
      debugPrint('FCM device token registered with backend OK');
    } catch (e) {
      debugPrint('FCM device token register failed: $e');
      if (e is DioException) {
        debugPrint('FCM register response: ${e.response?.data}');
      }
    } finally {
      _syncingToken = false;
    }
  }

  /// Unregister the stored FCM token from the backend (call before logout).
  Future<void> unregisterDeviceTokenFromServer() async {
    if (unregisterDeviceToken == null) return;
    try {
      final token =
          _fcm.token ?? LocalCache.instance.loadFcmToken();
      if (token == null || token.isEmpty) return;
      await unregisterDeviceToken!(token);
      await LocalCache.instance.clearFcmToken();
      debugPrint('FCM device token unregistered from backend');
    } catch (e) {
      debugPrint('FCM device token unregister failed: $e');
    }
  }

  void _handleTokenRefresh(String token) {
    LocalCache.instance.saveFcmToken(token);
    // Best-effort re-register when logged in (callback only set while app wired).
    syncDeviceTokenToServer();
  }

  void _setLocalTimezone() {
    try {
      final offset = DateTime.now().timeZoneOffset;
      for (final name in tz.timeZoneDatabase.locations.keys) {
        final loc = tz.getLocation(name);
        if (tz.TZDateTime.now(loc).timeZoneOffset == offset) {
          tz.setLocalLocation(loc);
          return;
        }
      }
    } catch (_) {
      // keep default (UTC)
    }
  }

  Future<void> _createChannels() async {
    final android = _local.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await android?.createNotificationChannel(
      const AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: 'تذكيرات الجرعات والمواعيد',
        importance: Importance.high,
      ),
    );
    await android?.createNotificationChannel(
      const AndroidNotificationChannel(
        _resultsChannelId,
        'نتائج التحاليل',
        description: 'إشعارات وصول النتائج والخزعات',
        importance: Importance.high,
      ),
    );
    await android?.requestNotificationsPermission();
  }

  // ---- FCM handlers -------------------------------------------------------

  Future<void> _ingestPush(RemoteMessage message) async {
    final item = PushInboxMapper.fromRemoteMessage(message);
    try {
      if (onPushReceived != null) {
        await onPushReceived!(item);
      } else {
        // Background isolate / early startup — write Hive directly.
        await LocalCache.instance.init();
        await LocalCache.instance.upsertNotification(item);
      }
    } catch (e) {
      debugPrint('FCM inbox upsert failed: $e');
    }
  }

  void _handleFcmForeground(RemoteMessage message) {
    final notif = message.notification;
    final route = PushInboxMapper.resolveDeepLink(message.data);
    final isResults = (message.data['type']?.toString() ?? '')
            .contains('lab') ||
        route.startsWith('/results');
    showLocalNow(
      title: notif?.title ?? message.data['title']?.toString() ?? 'إشعار جديد',
      body: notif?.body ??
          message.data['body']?.toString() ??
          'تحققوا من التطبيق للتفاصيل.',
      payload: route,
      results: isResults,
    );
    _ingestPush(message).then((_) => onInboxRefresh?.call());
  }

  void _handleFcmOpened(RemoteMessage message) {
    _ingestPush(message).then((_) {
      onInboxRefresh?.call();
      final link = PushInboxMapper.resolveDeepLink(message.data);
      onDeepLink?.call(link);
    });
  }

  /// Maps FCM data payload → in-app route.
  static String resolvePushDeepLink(Map<String, dynamic> data) =>
      PushInboxMapper.resolveDeepLink(data);

  // ---- Local: immediate ---------------------------------------------------

  Future<void> showLocalNow({
    required String title,
    required String body,
    required String payload,
    bool results = false,
  }) async {
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        results ? _resultsChannelId : _channelId,
        results ? 'نتائج التحاليل' : _channelName,
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await _local.show(
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title: title,
      body: body,
      notificationDetails: details,
      payload: payload,
    );
  }

  // ---- Local: scheduled dose reminders ------------------------------------

  Future<void> rescheduleDoseReminders(
    PatientRecord record, {
    required bool enabled,
  }) async {
    await _cancelDoseReminders();
    if (!enabled) {
      debugPrint('Dose reminders disabled — cancelled local schedules');
      return;
    }

    final nextDose = record.nextDoseDate;
    if (nextDose == null) {
      debugPrint('No dose reminder date — cancelled local schedules');
      return;
    }

    final childName = record.child.firstName;
    final dateLabel = '${nextDose.day}/${nextDose.month}';

    final dayBefore = DateTime(
      nextDose.year,
      nextDose.month,
      nextDose.day - 1,
      19,
    );
    await _scheduleAt(
      id: _doseBaseId,
      when: dayBefore,
      title: 'تذكير بالجرعة',
      body: 'لديكم جرعة $childName غدًا $dateLabel. نتمنى لكم يومًا طيبًا 🌟',
      payload: '/appointments',
    );

    final morningOf = DateTime(
      nextDose.year,
      nextDose.month,
      nextDose.day,
      8,
    );
    await _scheduleAt(
      id: _doseBaseId + 1,
      when: morningOf,
      title: 'تذكير بالجرعة اليوم',
      body: 'جرعة $childName اليوم. الفريق بانتظاركم 💙',
      payload: '/appointments',
    );

    debugPrint('Dose reminders scheduled for $nextDose ($childName)');
  }

  static const int _doseBaseId = 9000;

  Future<void> _cancelDoseReminders() async {
    await _local.cancel(id: _doseBaseId);
    await _local.cancel(id: _doseBaseId + 1);
  }

  Future<void> _scheduleAt({
    required int id,
    required DateTime when,
    required String title,
    required String body,
    required String payload,
  }) async {
    final scheduled = tz.TZDateTime.from(when, tz.local);
    if (scheduled.isBefore(tz.TZDateTime.now(tz.local))) return;

    await _local.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduled,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          _channelName,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: payload,
    );
    debugPrint('Scheduled dose reminder #$id at $scheduled');
  }
}
