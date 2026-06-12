// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian_prefs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuardianPrefsImpl _$$GuardianPrefsImplFromJson(Map<String, dynamic> json) =>
    _$GuardianPrefsImpl(
      doseReminders: json['doseReminders'] as bool? ?? true,
      resultAlerts: json['resultAlerts'] as bool? ?? true,
      biometricEnabled: json['biometricEnabled'] as bool? ?? true,
    );

Map<String, dynamic> _$$GuardianPrefsImplToJson(_$GuardianPrefsImpl instance) =>
    <String, dynamic>{
      'doseReminders': instance.doseReminders,
      'resultAlerts': instance.resultAlerts,
      'biometricEnabled': instance.biometricEnabled,
    };
