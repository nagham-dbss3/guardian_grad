// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LabResultViewImpl _$$LabResultViewImplFromJson(Map<String, dynamic> json) =>
    _$LabResultViewImpl(
      id: json['id'] as String,
      testType: json['testType'] as String,
      resultDate: DateTime.parse(json['resultDate'] as String),
      status: json['status'] as String,
      pdfPath: json['pdfPath'] as String,
      isRead: json['isRead'] as bool? ?? false,
      isBiopsy: json['isBiopsy'] as bool? ?? false,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$LabResultViewImplToJson(_$LabResultViewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testType': instance.testType,
      'resultDate': instance.resultDate.toIso8601String(),
      'status': instance.status,
      'pdfPath': instance.pdfPath,
      'isRead': instance.isRead,
      'isBiopsy': instance.isBiopsy,
      'summary': instance.summary,
    };

_$PrescriptionItemImpl _$$PrescriptionItemImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionItemImpl(
  med: json['med'] as String,
  dose: json['dose'] as String,
  instructions: json['instructions'] as String?,
);

Map<String, dynamic> _$$PrescriptionItemImplToJson(
  _$PrescriptionItemImpl instance,
) => <String, dynamic>{
  'med': instance.med,
  'dose': instance.dose,
  'instructions': instance.instructions,
};

_$DischargeReportViewImpl _$$DischargeReportViewImplFromJson(
  Map<String, dynamic> json,
) => _$DischargeReportViewImpl(
  id: json['id'] as String,
  lastDoseDate: DateTime.parse(json['lastDoseDate'] as String),
  prescription:
      (json['prescription'] as List<dynamic>?)
          ?.map((e) => PrescriptionItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <PrescriptionItem>[],
  doctorInstructions: json['doctorInstructions'] as String,
  nextDoseDate: DateTime.parse(json['nextDoseDate'] as String),
  nextVisitDepartment: json['nextVisitDepartment'] as String,
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  exportable: json['exportable'] as bool? ?? true,
);

Map<String, dynamic> _$$DischargeReportViewImplToJson(
  _$DischargeReportViewImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'lastDoseDate': instance.lastDoseDate.toIso8601String(),
  'prescription': instance.prescription,
  'doctorInstructions': instance.doctorInstructions,
  'nextDoseDate': instance.nextDoseDate.toIso8601String(),
  'nextVisitDepartment': instance.nextVisitDepartment,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'exportable': instance.exportable,
};

_$AppointmentViewImpl _$$AppointmentViewImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentViewImpl(
  id: json['id'] as String,
  dateTime: DateTime.parse(json['dateTime'] as String),
  type: json['type'] as String,
  department: json['department'] as String,
  isNextDose: json['isNextDose'] as bool? ?? false,
);

Map<String, dynamic> _$$AppointmentViewImplToJson(
  _$AppointmentViewImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'dateTime': instance.dateTime.toIso8601String(),
  'type': instance.type,
  'department': instance.department,
  'isNextDose': instance.isNextDose,
};
