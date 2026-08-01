// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInTokenImpl _$$CheckInTokenImplFromJson(Map<String, dynamic> json) =>
    _$CheckInTokenImpl(
      number: json['number'] as String,
      department: json['department'] as String,
      issueTime: DateTime.parse(json['issue_time'] as String),
      bookingTime: json['booking_time'] == null
          ? null
          : DateTime.parse(json['booking_time'] as String),
      status: json['status'] as String? ?? 'issued',
      visibleToGuardian: json['visible_to_guardian'] as bool? ?? true,
    );

Map<String, dynamic> _$$CheckInTokenImplToJson(_$CheckInTokenImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'department': instance.department,
      'issue_time': instance.issueTime.toIso8601String(),
      'booking_time': instance.bookingTime?.toIso8601String(),
      'status': instance.status,
      'visible_to_guardian': instance.visibleToGuardian,
    };

_$CheckInTokenResponseImpl _$$CheckInTokenResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CheckInTokenResponseImpl(
  patientFileNo: json['patient_file_no'] as String?,
  checkInToken: json['check_in_token'] == null
      ? null
      : CheckInToken.fromJson(json['check_in_token'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$CheckInTokenResponseImplToJson(
  _$CheckInTokenResponseImpl instance,
) => <String, dynamic>{
  'patient_file_no': instance.patientFileNo,
  'check_in_token': instance.checkInToken?.toJson(),
};
