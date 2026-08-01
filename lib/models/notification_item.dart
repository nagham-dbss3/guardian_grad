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
