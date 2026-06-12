// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationItemImpl _$$NotificationItemImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationItemImpl(
  id: json['id'] as String,
  type: $enumDecode(_$AppNotificationTypeEnumMap, json['type']),
  message: json['message'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  relatedId: json['relatedId'] as String?,
  isRead: json['isRead'] as bool? ?? false,
  deepLink: json['deepLink'] as String?,
);

Map<String, dynamic> _$$NotificationItemImplToJson(
  _$NotificationItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$AppNotificationTypeEnumMap[instance.type]!,
  'message': instance.message,
  'timestamp': instance.timestamp.toIso8601String(),
  'relatedId': instance.relatedId,
  'isRead': instance.isRead,
  'deepLink': instance.deepLink,
};

const _$AppNotificationTypeEnumMap = {
  AppNotificationType.doseReminder: 'doseReminder',
  AppNotificationType.resultArrived: 'resultArrived',
  AppNotificationType.update: 'update',
};
