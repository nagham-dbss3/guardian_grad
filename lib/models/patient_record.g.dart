// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientRecordImpl _$$PatientRecordImplFromJson(Map<String, dynamic> json) =>
    _$PatientRecordImpl(
      child: ChildSummary.fromJson(json['child'] as Map<String, dynamic>),
      diseaseOverview: DiseaseOverview.fromJson(
        json['diseaseOverview'] as Map<String, dynamic>,
      ),
      treatmentPlan: TreatmentPlanView.fromJson(
        json['treatmentPlan'] as Map<String, dynamic>,
      ),
      labResults:
          (json['labResults'] as List<dynamic>?)
              ?.map((e) => LabResultView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LabResultView>[],
      dischargeReports:
          (json['dischargeReports'] as List<dynamic>?)
              ?.map(
                (e) => DischargeReportView.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <DischargeReportView>[],
      appointments:
          (json['appointments'] as List<dynamic>?)
              ?.map((e) => AppointmentView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppointmentView>[],
      checkInToken: json['checkInToken'] == null
          ? null
          : CheckInToken.fromJson(json['checkInToken'] as Map<String, dynamic>),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PatientRecordImplToJson(_$PatientRecordImpl instance) =>
    <String, dynamic>{
      'child': instance.child,
      'diseaseOverview': instance.diseaseOverview,
      'treatmentPlan': instance.treatmentPlan,
      'labResults': instance.labResults,
      'dischargeReports': instance.dischargeReports,
      'appointments': instance.appointments,
      'checkInToken': instance.checkInToken,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
