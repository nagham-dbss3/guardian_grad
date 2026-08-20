import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_cache.dart';
import 'push_inbox_mapper.dart';

/// Top-level background handler (must be a top-level / static function).
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
  } catch (_) {
    // Ignore — background isolate may already have Firebase.
  }
  debugPrint(
    'FCM background message: ${message.messageId} '
    'type=${message.data['type']} ref=${message.data['referenceId']}',
  );

  // Persist into the notifications inbox so the tab shows it on next open.
  try {
    await LocalCache.instance.init();
    final item = PushInboxMapper.fromRemoteMessage(message);
    await LocalCache.instance.upsertNotification(item);
    debugPrint('FCM background saved to inbox — ${item.id}');
  } catch (e) {
    debugPrint('FCM background inbox save failed: $e');
  }
}

/// Thin wrapper around Firebase Cloud Messaging.
///
/// No-ops when Firebase was not initialized (missing google-services, etc.).
class FcmService {
  FcmService({
    required this.onMessage,
    required this.onMessageOpened,
    this.onTokenRefresh,
  });

  /// Called for foreground messages (caller renders a local notification).
  final void Function(RemoteMessage message) onMessage;

  /// Called when a notification is tapped and opens the app.
  final void Function(RemoteMessage message) onMessageOpened;

  /// Called whenever FCM issues / refreshes a device token.
  final void Function(String token)? onTokenRefresh;

  bool _available = false;
  bool get available => _available;
  String? token;

  Future<void> init() async {
    try {
      if (Firebase.apps.isEmpty) {
        debugPrint('FCM: Firebase not configured — push disabled.');
        return;
      }
      _available = true;

      final messaging = FirebaseMessaging.instance;

      final settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('FCM permission: ${settings.authorizationStatus}');

      // Android 13+ runtime permission is also requested via local notifications.
      token = await messaging.getToken();
      final current = token;
      if (current != null && current.isNotEmpty) {
        debugPrint('╔══════════════════════════════════════════════');
        debugPrint('║ FCM TOKEN (print this for backend tests):');
        debugPrint('║ $current');
        debugPrint('╚══════════════════════════════════════════════');
        onTokenRefresh?.call(current);
      } else {
        debugPrint('FCM TOKEN: null (permission denied or Firebase misconfigured)');
      }

      messaging.onTokenRefresh.listen((t) {
        token = t;
        debugPrint('╔══════════════════════════════════════════════');
        debugPrint('║ FCM TOKEN REFRESHED:');
        debugPrint('║ $t');
        debugPrint('╚══════════════════════════════════════════════');
        onTokenRefresh?.call(t);
      });

      FirebaseMessaging.onMessage.listen(onMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpened);

      final initial = await messaging.getInitialMessage();
      if (initial != null) onMessageOpened(initial);
    } catch (e) {
      _available = false;
      debugPrint('FCM init skipped/failed: $e');
    }
  }

  Future<String?> refreshToken() async {
    if (!_available) return token;
    try {
      token = await FirebaseMessaging.instance.getToken();
      return token;
    } catch (e) {
      debugPrint('FCM getToken failed: $e');
      return token;
    }
  }
}
