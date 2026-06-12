import 'package:freezed_annotation/freezed_annotation.dart';
import 'child.dart';
import 'checkin.dart';
import 'clinical.dart';
import 'treatment.dart';

part 'patient_record.freezed.dart';
part 'patient_record.g.dart';

/// The full read-only bundle for one child. Cached in Hive so it is available
/// offline. [lastUpdated] backs the "آخر تحديث…" indicator.
@freezed
class PatientRecord with _$PatientRecord {
  const factory PatientRecord({
    required ChildSummary child,
    required DiseaseOverview diseaseOverview,
    required TreatmentPlanView treatmentPlan,
    @Default(<LabResultView>[]) List<LabResultView> labResults,
    @Default(<DischargeReportView>[]) List<DischargeReportView> dischargeReports,
    @Default(<AppointmentView>[]) List<AppointmentView> appointments,
    CheckInToken? checkInToken,
    required DateTime lastUpdated,
  }) = _PatientRecord;

  const PatientRecord._();

  factory PatientRecord.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordFromJson(json);

  /// Latest discharge report (drives the next-dose reminder).
  DischargeReportView? get latestDischarge {
    if (dischargeReports.isEmpty) return null;
    final sorted = [...dischargeReports]
      ..sort((a, b) => b.generatedAt.compareTo(a.generatedAt));
    return sorted.first;
  }

  /// The single next dose date the parent should be reminded about.
  DateTime? get nextDoseDate => latestDischarge?.nextDoseDate;

  AppointmentView? get nextAppointment {
    final upcoming = appointments.toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return upcoming.isEmpty ? null : upcoming.first;
  }

  int get unreadResults => labResults.where((r) => !r.isRead).length;
}
