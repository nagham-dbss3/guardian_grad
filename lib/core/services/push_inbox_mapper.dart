import 'package:firebase_messaging/firebase_messaging.dart';

import '../../models/notification_item.dart';

/// Maps FCM payloads into inbox rows + in-app routes (no service deps).
class PushInboxMapper {
  PushInboxMapper._();

  static NotificationItem fromRemoteMessage(RemoteMessage message) {
    final data = message.data;
    final notif = message.notification;
    final item = NotificationItem.fromPushPayload(
      messageId: message.messageId,
      title: notif?.title ?? data['title']?.toString(),
      body: notif?.body ??
          data['body']?.toString() ??
          data['message']?.toString(),
      data: data,
    );
    // Prefer derived route when payload has no deepLink.
    if (item.deepLink == null || item.deepLink!.isEmpty) {
      return item.copyWith(deepLink: resolveDeepLink(data));
    }
    return item;
  }

  static String resolveDeepLink(Map<String, dynamic> data) {
    final explicit = data['deepLink'] ?? data['deep_link'];
    if (explicit != null && explicit.toString().isNotEmpty) {
      return explicit.toString();
    }

    final type = (data['type'] ?? '').toString().toLowerCase();
    final ref =
        (data['referenceId'] ?? data['reference_id'] ?? data['relatedId'])
            ?.toString();

    switch (type) {
      case 'lab_result':
      case 'resultarrived':
      case 'result_arrived':
        if (ref != null && ref.isNotEmpty) return '/results/$ref';
        return '/results';
      case 'appointment':
        return '/appointments';
      case 'dose':
      case 'dosereminder':
      case 'dose_reminder':
        return '/appointments';
      default:
        return '/notifications';
    }
  }
}
