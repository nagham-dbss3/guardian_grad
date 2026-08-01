// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChildSummaryImpl _$$ChildSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ChildSummaryImpl(
      fileNoBasma: json['fileNoBasma'] as String,
      firstName: json['firstName'] as String,
      familyName: json['familyName'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      currentPhase: json['currentPhase'] as String,
      photoUrl: json['photoUrl'] as String?,
      nationalIdMasked: json['nationalIdMasked'] as String?,
      guardianRelationship: json['guardianRelationship'] as String?,
    );

Map<String, dynamic> _$$ChildSummaryImplToJson(_$ChildSummaryImpl instance) =>
    <String, dynamic>{
      'fileNoBasma': instance.fileNoBasma,
      'firstName': instance.firstName,
      'familyName': instance.familyName,
      'age': instance.age,
      'gender': instance.gender,
      'currentPhase': instance.currentPhase,
      'photoUrl': instance.photoUrl,
      'nationalIdMasked': instance.nationalIdMasked,
      'guardianRelationship': instance.guardianRelationship,
    };

_$GuardianProfileImpl _$$GuardianProfileImplFromJson(
  Map<String, dynamic> json,
) => _$GuardianProfileImpl(
  id: const FlexibleStringConverter().fromJson(json['id']),
  name: json['name'] as String,
  relationshipToChild: json['relationshipToChild'] as String,
  contactPhone: json['contactPhone'] as String?,
  contactEmail: json['contactEmail'] as String?,
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => ChildSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChildSummary>[],
);

Map<String, dynamic> _$$GuardianProfileImplToJson(
  _$GuardianProfileImpl instance,
) => <String, dynamic>{
  'id': const FlexibleStringConverter().toJson(instance.id),
  'name': instance.name,
  'relationshipToChild': instance.relationshipToChild,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
  'children': instance.children.map((e) => e.toJson()).toList(),
};

_$ChildrenListResponseImpl _$$ChildrenListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChildrenListResponseImpl(
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => ChildSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChildSummary>[],
);

Map<String, dynamic> _$$ChildrenListResponseImplToJson(
  _$ChildrenListResponseImpl instance,
) => <String, dynamic>{
  'children': instance.children.map((e) => e.toJson()).toList(),
};

_$DiseaseOverviewImpl _$$DiseaseOverviewImplFromJson(
  Map<String, dynamic> json,
) => _$DiseaseOverviewImpl(
  summary: json['summary'] as String,
  category: json['category'] as String?,
);

Map<String, dynamic> _$$DiseaseOverviewImplToJson(
  _$DiseaseOverviewImpl instance,
) => <String, dynamic>{
  'summary': instance.summary,
  'category': instance.category,
};
