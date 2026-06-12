import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../../models/patient_record.dart';
import 'fcm_service.dart';

/// Façade over FCM (push) + flutter_local_notifications (local + scheduled).
/// Deep links are surfaced via [onDeepLink], wired by the router.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  late final FcmService _fcm = FcmService(
    onMessage: _handleFcmForeground,
    onMessageOpened: _handleFcmOpened,
  );

  /// Set by the router so taps navigate to the right screen.
  void Function(String route)? onDeepLink;

  static const _channelId = 'basma_care';
  static const _channelName = 'تذكيرات بسمة';
  static const _resultsChannelId = 'basma_results';

  bool _ready = false;

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

  String? get fcmToken => _fcm.token;
  bool get pushAvailable => _fcm.available;

  void _setLocalTimezone() {
    // Approximate the device timezone from the current UTC offset. For an
    // exact zone (DST-aware) bundle flutter_timezone; this is fine for the
    // demo. Falls back to UTC if no match is found.
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

  void _handleFcmForeground(RemoteMessage message) {
    final notif = message.notification;
    showLocalNow(
      title: notif?.title ?? 'وصلت نتيجة جديدة',
      body: notif?.body ?? 'تحقق من نتائج التحاليل.',
      payload: message.data['deepLink'] as String? ?? '/results',
      results: true,
    );
  }

  void _handleFcmOpened(RemoteMessage message) {
    final link = message.data['deepLink'] as String?;
    if (link != null) onDeepLink?.call(link);
  }

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
      ),
      iOS: const DarwinNotificationDetails(),
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

  /// Reschedule dose reminders for [record]. Cancels existing reminders first,
  /// then schedules a day-before and morning-of reminder for the next dose.
  /// Respects [enabled] (the user's preference toggle).
  Future<void> rescheduleDoseReminders(
    PatientRecord record, {
    required bool enabled,
  }) async {
    await _cancelDoseReminders();
    if (!enabled) return;

    final nextDose = record.nextDoseDate;
    if (nextDose == null) return;

    final childName = record.child.firstName;
    final dateLabel = '${nextDose.day}/${nextDose.month}';

    // Day-before, at 7pm.
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

    // Morning-of, at 8am.
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
    // Don't schedule in the past.
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
