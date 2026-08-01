// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      status: json['status'] as String,
      permissions:
          (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      lastActivity: json['last_activity'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'permissions': instance.permissions,
      'last_activity': instance.lastActivity,
    };

_$AuthResultModelImpl _$$AuthResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResultModelImpl(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String,
);

Map<String, dynamic> _$$AuthResultModelImplToJson(
  _$AuthResultModelImpl instance,
) => <String, dynamic>{'user': instance.user.toJson(), 'token': instance.token};
