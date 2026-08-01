// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemImpl(
  id: const FlexibleStringConverter().fromJson(json['id']),
  type:
      $enumDecodeNullable(
        _$AppNotificationTypeEnumMap,
        json['type'],
        unknownValue: AppNotificationType.update,
      ) ??
      AppNotificationType.update,
  message: json['message'] as String? ?? '',
  timestamp: DateTime.parse(json['timestamp'] as String),
  relatedId: const FlexibleNullableStringConverter().fromJson(
    json['relatedId'],
  ),
  isRead: json['isRead'] as bool? ?? false,
  deepLink: json['deepLink'] as String?,
);

Map<String, dynamic> _$$NotificationItemImplToJson(
  _$NotificationItemImpl instance,
) => <String, dynamic>{
  'id': const FlexibleStringConverter().toJson(instance.id),
  'type': _$AppNotificationTypeEnumMap[instance.type]!,
  'message': instance.message,
  'timestamp': instance.timestamp.toIso8601String(),
  'relatedId': const FlexibleNullableStringConverter().toJson(
    instance.relatedId,
  ),
  'isRead': instance.isRead,
  'deepLink': instance.deepLink,
};

const _$AppNotificationTypeEnumMap = {
  AppNotificationType.resultArrived: 'resultArrived',
  AppNotificationType.labResult: 'lab_result',
  AppNotificationType.appointment: 'appointment',
  AppNotificationType.dose: 'dose',
  AppNotificationType.doseReminder: 'doseReminder',
  AppNotificationType.update: 'update',
};

_$NotificationsListResponseImpl _$$NotificationsListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationsListResponseImpl(
  notifications:
      (json['notifications'] as List<dynamic>?)
          ?.map((e) => NotificationItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <NotificationItem>[],
);

Map<String, dynamic> _$$NotificationsListResponseImplToJson(
  _$NotificationsListResponseImpl instance,
) => <String, dynamic>{
  'notifications': instance.notifications.map((e) => e.toJson()).toList(),
};
