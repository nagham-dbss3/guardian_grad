import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

enum AppNotificationType {
  @JsonValue('doseReminder')
  doseReminder,
  @JsonValue('resultArrived')
  resultArrived,
  @JsonValue('update')
  update,
}

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required AppNotificationType type,
    required String message,
    required DateTime timestamp,
    String? relatedId,
    @Default(false) bool isRead,
    String? deepLink,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}
