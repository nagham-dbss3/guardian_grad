// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StageViewImpl _$$StageViewImplFromJson(Map<String, dynamic> json) =>
    _$StageViewImpl(
      name: json['name'] as String,
      status: $enumDecode(
        _$StageStatusEnumMap,
        json['status'],
        unknownValue: StageStatus.upcoming,
      ),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      medsSummary: json['medsSummary'] as String?,
      visitsSummary: json['visitsSummary'] as String?,
    );

Map<String, dynamic> _$$StageViewImplToJson(_$StageViewImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': _$StageStatusEnumMap[instance.status]!,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'medsSummary': instance.medsSummary,
      'visitsSummary': instance.visitsSummary,
    };

const _$StageStatusEnumMap = {
  StageStatus.completed: 'completed',
  StageStatus.current: 'current',
  StageStatus.upcoming: 'upcoming',
};

_$TreatmentPlanViewImpl _$$TreatmentPlanViewImplFromJson(
  Map<String, dynamic> json,
) => _$TreatmentPlanViewImpl(
  planName: json['planName'] as String? ?? '',
  stages:
      (json['stages'] as List<dynamic>?)
          ?.map((e) => StageView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <StageView>[],
);

Map<String, dynamic> _$$TreatmentPlanViewImplToJson(
  _$TreatmentPlanViewImpl instance,
) => <String, dynamic>{
  'planName': instance.planName,
  'stages': instance.stages.map((e) => e.toJson()).toList(),
};
