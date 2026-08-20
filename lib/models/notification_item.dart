import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/utils/json_converters.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

/// Notification kinds from `GET /guardian/notifications`.
enum AppNotificationType {
  @JsonValue('resultArrived')
  resultArrived,
  @JsonValue('lab_result')
  labResult,
  @JsonValue('appointment')
  appointment,
  @JsonValue('dose')
  dose,
  @JsonValue('doseReminder')
  doseReminder,
  @JsonValue('update')
  update,
}

/// Inbox item — matches live API:
/// `{ id, type, message, timestamp, relatedId, isRead, deepLink }`.
@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    @FlexibleStringConverter() required String id,
    @JsonKey(unknownEnumValue: AppNotificationType.update)
    @Default(AppNotificationType.update)
    AppNotificationType type,
    @Default('') String message,
    required DateTime timestamp,
    @FlexibleNullableStringConverter() String? relatedId,
    @Default(false) bool isRead,
    String? deepLink,
  }) = _NotificationItem;

  const NotificationItem._();

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(_normalizeNotificationJson(json));

  /// Builds an inbox row from an FCM / local push payload.
  ///
  /// Ids are prefixed with `fcm:` so API sync can keep them when the server
  /// inbox does not yet include the same push.
  factory NotificationItem.fromPushPayload({
    String? messageId,
    String? title,
    String? body,
    Map<String, dynamic> data = const {},
  }) {
    final typeRaw =
        (data['type'] ?? data['notificationType'] ?? '').toString();
    final related = const FlexibleNullableStringConverter().fromJson(
      data['relatedId'] ?? data['referenceId'] ?? data['reference_id'],
    );
    final deepLink = (data['deepLink'] ?? data['deep_link'])?.toString();
    final tsRaw = data['timestamp'] ?? data['createdAt'];
    final timestamp = tsRaw == null
        ? DateTime.now()
        : (DateTime.tryParse(tsRaw.toString()) ?? DateTime.now());

    final trimmedTitle = title?.trim();
    final trimmedBody = body?.trim();
    late final String message;
    if (trimmedBody != null && trimmedBody.isNotEmpty) {
      if (trimmedTitle != null &&
          trimmedTitle.isNotEmpty &&
          trimmedTitle != trimmedBody) {
        message = '$trimmedTitle\n$trimmedBody';
      } else {
        message = trimmedBody;
      }
    } else if (trimmedTitle != null && trimmedTitle.isNotEmpty) {
      message = trimmedTitle;
    } else {
      message = 'إشعار جديد';
    }

    final rawId = (messageId ?? data['id'] ?? data['notificationId'])
        ?.toString()
        .trim();
    final id = (rawId != null && rawId.isNotEmpty)
        ? (rawId.startsWith('fcm:') ? rawId : 'fcm:$rawId')
        : 'fcm:${timestamp.millisecondsSinceEpoch}';

    return NotificationItem(
      id: id,
      type: parseNotificationType(typeRaw),
      message: message,
      timestamp: timestamp,
      relatedId: related,
      isRead: false,
      deepLink: (deepLink != null && deepLink.isNotEmpty) ? deepLink : null,
    );
  }

  /// True when this row was created from a device push (not from API inbox).
  bool get isLocalPush => id.startsWith('fcm:');

  /// Text shown in list tiles.
  String get displayText => message;

  /// Prefer API `deepLink`, else derive from type + relatedId.
  String get route {
    final link = deepLink?.trim();
    if (link != null && link.isNotEmpty) return link;

    switch (type) {
      case AppNotificationType.labResult:
      case AppNotificationType.resultArrived:
        final id = relatedId;
        if (id != null && id.isNotEmpty) return '/results/$id';
        return '/results';
      case AppNotificationType.appointment:
        return '/appointments';
      case AppNotificationType.dose:
      case AppNotificationType.doseReminder:
        return '/appointments';
      case AppNotificationType.update:
        return '/notifications';
    }
  }
}

/// Wrapper for `GET /guardian/notifications`.
@freezed
class NotificationsListResponse with _$NotificationsListResponse {
  const factory NotificationsListResponse({
    @Default(<NotificationItem>[]) List<NotificationItem> notifications,
  }) = _NotificationsListResponse;

  factory NotificationsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListResponseFromJson(json);
}

typedef NotificationModel = NotificationItem;

Map<String, dynamic> _normalizeNotificationJson(Map<String, dynamic> json) {
  final map = Map<String, dynamic>.from(json);
  // Accept both live API keys and any alternate naming.
  map['message'] ??= map['body'] ?? '';
  map['timestamp'] ??= map['createdAt'] ?? DateTime.now().toIso8601String();
  map['relatedId'] ??= map['referenceId'];
  map['deepLink'] ??= map['deep_link'];
  return map;
}

/// Maps FCM / API type strings to [AppNotificationType].
AppNotificationType parseNotificationType(String? raw) {
  switch ((raw ?? '').trim().toLowerCase()) {
    case 'lab_result':
    case 'labresult':
    case 'resultarrived':
    case 'result_arrived':
      return AppNotificationType.labResult;
    case 'appointment':
      return AppNotificationType.appointment;
    case 'dose':
    case 'dosereminder':
    case 'dose_reminder':
      return AppNotificationType.doseReminder;
    default:
      return AppNotificationType.update;
  }
}

/// Whether this inbox row was created locally from an FCM push.
bool isLocalPushNotificationId(String id) =>
    id.startsWith('fcm:') || id.startsWith('fcm-');
