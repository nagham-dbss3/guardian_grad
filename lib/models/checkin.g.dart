// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInTokenImpl _$$CheckInTokenImplFromJson(Map<String, dynamic> json) =>
    _$CheckInTokenImpl(
      number: json['number'] as String,
      department: json['department'] as String,
      issueTime: DateTime.parse(json['issueTime'] as String),
      bookingTime: json['bookingTime'] == null
          ? null
          : DateTime.parse(json['bookingTime'] as String),
      status: json['status'] as String? ?? 'issued',
      visibleToGuardian: json['visibleToGuardian'] as bool? ?? true,
    );

Map<String, dynamic> _$$CheckInTokenImplToJson(_$CheckInTokenImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'department': instance.department,
      'issueTime': instance.issueTime.toIso8601String(),
      'bookingTime': instance.bookingTime?.toIso8601String(),
      'status': instance.status,
      'visibleToGuardian': instance.visibleToGuardian,
    };
