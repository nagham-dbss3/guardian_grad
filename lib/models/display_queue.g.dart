// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DisplayQueueTokenImpl _$$DisplayQueueTokenImplFromJson(
  Map<String, dynamic> json,
) => _$DisplayQueueTokenImpl(
  id: const FlexibleStringConverter().fromJson(json['id']),
  number: json['number'] as String,
  status: json['status'] as String,
  isEmergency: json['is_emergency'] as bool? ?? false,
  issueTime: const RequiredDateTimeConverter().fromJson(json['issue_time']),
);

Map<String, dynamic> _$$DisplayQueueTokenImplToJson(
  _$DisplayQueueTokenImpl instance,
) => <String, dynamic>{
  'id': const FlexibleStringConverter().toJson(instance.id),
  'number': instance.number,
  'status': instance.status,
  'is_emergency': instance.isEmergency,
  'issue_time': const RequiredDateTimeConverter().toJson(instance.issueTime),
};

_$DisplayDepartmentQueueImpl _$$DisplayDepartmentQueueImplFromJson(
  Map<String, dynamic> json,
) => _$DisplayDepartmentQueueImpl(
  department: json['department'] as String,
  tokens:
      (json['tokens'] as List<dynamic>?)
          ?.map((e) => DisplayQueueToken.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DisplayQueueToken>[],
);

Map<String, dynamic> _$$DisplayDepartmentQueueImplToJson(
  _$DisplayDepartmentQueueImpl instance,
) => <String, dynamic>{
  'department': instance.department,
  'tokens': instance.tokens.map((e) => e.toJson()).toList(),
};

_$DisplayQueuesResponseImpl _$$DisplayQueuesResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DisplayQueuesResponseImpl(
  departments:
      (json['departments'] as List<dynamic>?)
          ?.map(
            (e) => DisplayDepartmentQueue.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <DisplayDepartmentQueue>[],
);

Map<String, dynamic> _$$DisplayQueuesResponseImplToJson(
  _$DisplayQueuesResponseImpl instance,
) => <String, dynamic>{
  'departments': instance.departments.map((e) => e.toJson()).toList(),
};
