import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/utils/json_converters.dart';

part 'clinical.freezed.dart';
part 'clinical.g.dart';

/// Single lab result item (camelCase API contract).
@freezed
class LabResultView with _$LabResultView {
  const factory LabResultView({
    required String id,
    required String testType,
    required DateTime resultDate,
    required String status,
    @Default('') String pdfPath,
    @Default(false) bool isRead,
    @Default(false) bool isBiopsy,
    String? summary,
  }) = _LabResultView;

  factory LabResultView.fromJson(Map<String, dynamic> json) =>
      _$LabResultViewFromJson(json);
}

/// Alias matching the API naming in product docs.
typedef LabResultModel = LabResultView;

/// Wrapper for `GET /guardian/children/{fileNo}/lab-results`.
@freezed
class LabResultsResponse with _$LabResultsResponse {
  const factory LabResultsResponse({
    @Default(<LabResultView>[]) List<LabResultView> labResults,
  }) = _LabResultsResponse;

  factory LabResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$LabResultsResponseFromJson(json);
}

@freezed
class PrescriptionItem with _$PrescriptionItem {
  const factory PrescriptionItem({
    required String med,
    required String dose,
    String? instructions,
  }) = _PrescriptionItem;

  factory PrescriptionItem.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionItemFromJson(json);
}

/// Discharge report as returned inside `dischargeReports` list.
@freezed
class DischargeReportView with _$DischargeReportView {
  const factory DischargeReportView({
    required String id,
    required DateTime lastDoseDate,
    @Default(<PrescriptionItem>[]) List<PrescriptionItem> prescription,
    @Default('') String doctorInstructions,
    required DateTime nextDoseDate,
    @Default('') String nextVisitDepartment,
    required DateTime generatedAt,
    @Default(true) bool exportable,
  }) = _DischargeReportView;

  factory DischargeReportView.fromJson(Map<String, dynamic> json) =>
      _$DischargeReportViewFromJson(json);
}

/// Alias matching the API naming in product docs.
typedef DischargeReportModel = DischargeReportView;

/// Wrapper for `GET /guardian/children/{fileNo}/discharge-reports`.
@freezed
class DischargeReportsResponse with _$DischargeReportsResponse {
  const factory DischargeReportsResponse({
    @Default(<DischargeReportView>[])
    List<DischargeReportView> dischargeReports,
  }) = _DischargeReportsResponse;

  factory DischargeReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$DischargeReportsResponseFromJson(json);
}

/// Next-dose reminder payload from
/// `GET /guardian/children/{fileNo}/dose-reminder`.
///
/// API may return `doseReminder: null` or an object with [nextDoseDate].
@freezed
class DoseReminderModel with _$DoseReminderModel {
  const factory DoseReminderModel({
    DateTime? nextDoseDate,
    String? message,
    String? notes,
  }) = _DoseReminderModel;

  factory DoseReminderModel.fromJson(Map<String, dynamic> json) =>
      _$DoseReminderModelFromJson(json);
}

/// Wrapper for the dose-reminder endpoint.
@freezed
class DoseReminderResponse with _$DoseReminderResponse {
  const factory DoseReminderResponse({
    DoseReminderModel? doseReminder,
  }) = _DoseReminderResponse;

  factory DoseReminderResponse.fromJson(Map<String, dynamic> json) =>
      _$DoseReminderResponseFromJson(json);
}

@freezed
class AppointmentView with _$AppointmentView {
  const factory AppointmentView({
    @FlexibleStringConverter() @Default('') String id,
    @JsonKey(name: 'date_time')
    @RequiredDateTimeConverter()
    required DateTime dateTime,
    @FlexibleStringConverter() @Default('') String type,
    @FlexibleStringConverter() @Default('') String department,
    @JsonKey(name: 'is_next_dose') @Default(false) bool isNextDose,
  }) = _AppointmentView;

  factory AppointmentView.fromJson(Map<String, dynamic> json) =>
      _$AppointmentViewFromJson(json);
}

/// Alias matching the API naming in product docs.
typedef AppointmentModel = AppointmentView;

/// Wrapper for `GET /guardian/children/{fileNo}/appointments` (snake_case).
@freezed
class ChildAppointmentsResponse with _$ChildAppointmentsResponse {
  const factory ChildAppointmentsResponse({
    @JsonKey(name: 'patient_file_no')
    @FlexibleNullableStringConverter()
    String? patientFileNo,
    @Default(<AppointmentView>[]) List<AppointmentView> appointments,
  }) = _ChildAppointmentsResponse;

  factory ChildAppointmentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChildAppointmentsResponseFromJson(json);
}
