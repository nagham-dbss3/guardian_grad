import 'package:freezed_annotation/freezed_annotation.dart';
import 'child.dart';
import 'checkin.dart';
import 'clinical.dart';
import 'treatment.dart';

part 'patient_record.freezed.dart';
part 'patient_record.g.dart';

/// The full read-only bundle for one child. Cached in Hive so it is available
/// offline. [lastUpdated] backs the "آخر تحديث…" indicator.
///
/// Matches `GET /guardian/children/{fileNo}/record` (camelCase).
@freezed
class PatientRecord with _$PatientRecord {
  const factory PatientRecord({
    required ChildSummary child,
    required DiseaseOverview diseaseOverview,
    required TreatmentPlanView treatmentPlan,
    @Default(<LabResultView>[]) List<LabResultView> labResults,
    @Default(<DischargeReportView>[]) List<DischargeReportView> dischargeReports,
    @Default(<AppointmentView>[]) List<AppointmentView> appointments,
    DoseReminderModel? doseReminder,
    CheckInToken? checkInToken,
    required DateTime lastUpdated,
  }) = _PatientRecord;

  const PatientRecord._();

  factory PatientRecord.fromJson(Map<String, dynamic> json) =>
      _$PatientRecordFromJson(_normalizeRecordJson(json));

  /// Latest discharge report (fallback for next-dose when API reminder is null).
  DischargeReportView? get latestDischarge {
    if (dischargeReports.isEmpty) return null;
    final sorted = [...dischargeReports]
      ..sort((a, b) => b.generatedAt.compareTo(a.generatedAt));
    return sorted.first;
  }

  /// Prefer dedicated dose-reminder API, else latest discharge next dose.
  DateTime? get nextDoseDate =>
      doseReminder?.nextDoseDate ?? latestDischarge?.nextDoseDate;

  AppointmentView? get nextAppointment {
    final upcoming = appointments.toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return upcoming.isEmpty ? null : upcoming.first;
  }

  int get unreadResults => labResults.where((r) => !r.isRead).length;
}

/// Alias matching product / API naming ("Child Record Bundle").
typedef ChildRecordModel = PatientRecord;

Map<String, dynamic> _normalizeRecordJson(Map<String, dynamic> json) {
  final map = Map<String, dynamic>.from(json);

  map['diseaseOverview'] ??= const {
    'summary': 'سيتم عرض تفاصيل الحالة قريبًا.',
  };
  map['treatmentPlan'] ??= const {'planName': '', 'stages': <dynamic>[]};
  map['labResults'] ??= const <dynamic>[];
  map['dischargeReports'] ??= const <dynamic>[];
  map['appointments'] ??= const <dynamic>[];
  map['lastUpdated'] ??= DateTime.now().toIso8601String();

  final appointments = map['appointments'];
  if (appointments is List) {
    map['appointments'] = appointments.map((item) {
      if (item is! Map) return item;
      final m = Map<String, dynamic>.from(item);
      m['date_time'] ??= m['dateTime'] ?? m['datetime'] ?? m['date'];
      m['is_next_dose'] ??= m['isNextDose'];
      m['id'] ??= m['appointment_id'] ?? m['appointmentId'];
      return m;
    }).toList();
  }

  return map;
}
