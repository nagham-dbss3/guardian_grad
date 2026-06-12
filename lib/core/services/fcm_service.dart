import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Top-level background handler (required by FCM to be a top-level function).
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Keep light: in production, persist or pre-fetch. Here we just log.
  debugPrint('FCM background message: ${message.messageId}');
}

/// Thin wrapper around Firebase Cloud Messaging. **Guarded**: if Firebase is
/// not configured (no google-services.json / GoogleService-Info.plist), the
/// whole thing no-ops so the app still runs in dev/mock.
class FcmService {
  FcmService({required this.onMessage, required this.onMessageOpened});

  /// Called for foreground messages (caller renders a local notification).
  final void Function(RemoteMessage message) onMessage;

  /// Called when a notification is tapped and opens the app.
  final void Function(RemoteMessage message) onMessageOpened;

  bool _available = false;
  bool get available => _available;
  String? token;

  Future<void> init() async {
    try {
      // If no Firebase app was initialized in main(), bail out quietly.
      if (Firebase.apps.isEmpty) {
        debugPrint('FCM: Firebase not configured — push disabled (mock mode).');
        return;
      }
      _available = true;

      final messaging = FirebaseMessaging.instance;
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

      final settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('FCM permission: ${settings.authorizationStatus}');

      token = await messaging.getToken();
      debugPrint('FCM token: $token');
      messaging.onTokenRefresh.listen((t) {
        token = t;
        debugPrint('FCM token refreshed: $t');
      });

      FirebaseMessaging.onMessage.listen(onMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpened);

      // App opened from terminated state via a notification tap.
      final initial = await messaging.getInitialMessage();
      if (initial != null) onMessageOpened(initial);
    } catch (e) {
      _available = false;
      debugPrint('FCM init skipped/failed (mock mode): $e');
    }
  }
}
