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
      pdfPath: json['pdfPath'] as String? ?? '',
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

_$LabResultsResponseImpl _$$LabResultsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LabResultsResponseImpl(
  labResults:
      (json['labResults'] as List<dynamic>?)
          ?.map((e) => LabResultView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LabResultView>[],
);

Map<String, dynamic> _$$LabResultsResponseImplToJson(
  _$LabResultsResponseImpl instance,
) => <String, dynamic>{
  'labResults': instance.labResults.map((e) => e.toJson()).toList(),
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
  doctorInstructions: json['doctorInstructions'] as String? ?? '',
  nextDoseDate: DateTime.parse(json['nextDoseDate'] as String),
  nextVisitDepartment: json['nextVisitDepartment'] as String? ?? '',
  generatedAt: DateTime.parse(json['generatedAt'] as String),
  exportable: json['exportable'] as bool? ?? true,
);

Map<String, dynamic> _$$DischargeReportViewImplToJson(
  _$DischargeReportViewImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'lastDoseDate': instance.lastDoseDate.toIso8601String(),
  'prescription': instance.prescription.map((e) => e.toJson()).toList(),
  'doctorInstructions': instance.doctorInstructions,
  'nextDoseDate': instance.nextDoseDate.toIso8601String(),
  'nextVisitDepartment': instance.nextVisitDepartment,
  'generatedAt': instance.generatedAt.toIso8601String(),
  'exportable': instance.exportable,
};

_$DischargeReportsResponseImpl _$$DischargeReportsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DischargeReportsResponseImpl(
  dischargeReports:
      (json['dischargeReports'] as List<dynamic>?)
          ?.map((e) => DischargeReportView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <DischargeReportView>[],
);

Map<String, dynamic> _$$DischargeReportsResponseImplToJson(
  _$DischargeReportsResponseImpl instance,
) => <String, dynamic>{
  'dischargeReports': instance.dischargeReports.map((e) => e.toJson()).toList(),
};

_$DoseReminderModelImpl _$$DoseReminderModelImplFromJson(
  Map<String, dynamic> json,
) => _$DoseReminderModelImpl(
  nextDoseDate: json['nextDoseDate'] == null
      ? null
      : DateTime.parse(json['nextDoseDate'] as String),
  message: json['message'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$DoseReminderModelImplToJson(
  _$DoseReminderModelImpl instance,
) => <String, dynamic>{
  'nextDoseDate': instance.nextDoseDate?.toIso8601String(),
  'message': instance.message,
  'notes': instance.notes,
};

_$DoseReminderResponseImpl _$$DoseReminderResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DoseReminderResponseImpl(
  doseReminder: json['doseReminder'] == null
      ? null
      : DoseReminderModel.fromJson(
          json['doseReminder'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$DoseReminderResponseImplToJson(
  _$DoseReminderResponseImpl instance,
) => <String, dynamic>{'doseReminder': instance.doseReminder?.toJson()};

_$AppointmentViewImpl _$$AppointmentViewImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentViewImpl(
  id: json['id'] == null
      ? ''
      : const FlexibleStringConverter().fromJson(json['id']),
  dateTime: const RequiredDateTimeConverter().fromJson(json['date_time']),
  type: json['type'] == null
      ? ''
      : const FlexibleStringConverter().fromJson(json['type']),
  department: json['department'] == null
      ? ''
      : const FlexibleStringConverter().fromJson(json['department']),
  isNextDose: json['is_next_dose'] as bool? ?? false,
);

Map<String, dynamic> _$$AppointmentViewImplToJson(
  _$AppointmentViewImpl instance,
) => <String, dynamic>{
  'id': const FlexibleStringConverter().toJson(instance.id),
  'date_time': const RequiredDateTimeConverter().toJson(instance.dateTime),
  'type': const FlexibleStringConverter().toJson(instance.type),
  'department': const FlexibleStringConverter().toJson(instance.department),
  'is_next_dose': instance.isNextDose,
};

_$ChildAppointmentsResponseImpl _$$ChildAppointmentsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChildAppointmentsResponseImpl(
  patientFileNo: const FlexibleNullableStringConverter().fromJson(
    json['patient_file_no'],
  ),
  appointments:
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => AppointmentView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AppointmentView>[],
);

Map<String, dynamic> _$$ChildAppointmentsResponseImplToJson(
  _$ChildAppointmentsResponseImpl instance,
) => <String, dynamic>{
  'patient_file_no': const FlexibleNullableStringConverter().toJson(
    instance.patientFileNo,
  ),
  'appointments': instance.appointments.map((e) => e.toJson()).toList(),
};
