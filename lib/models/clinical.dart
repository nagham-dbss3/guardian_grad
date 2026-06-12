import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinical.freezed.dart';
part 'clinical.g.dart';

@freezed
class LabResultView with _$LabResultView {
  const factory LabResultView({
    required String id,
    required String testType,
    required DateTime resultDate,
    required String status,
    required String pdfPath,
    @Default(false) bool isRead,
    @Default(false) bool isBiopsy,
    String? summary,
  }) = _LabResultView;

  factory LabResultView.fromJson(Map<String, dynamic> json) =>
      _$LabResultViewFromJson(json);
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

@freezed
class DischargeReportView with _$DischargeReportView {
  const factory DischargeReportView({
    required String id,
    required DateTime lastDoseDate,
    @Default(<PrescriptionItem>[]) List<PrescriptionItem> prescription,
    required String doctorInstructions,
    required DateTime nextDoseDate,
    required String nextVisitDepartment, // e.g. نهاري / داخلي
    required DateTime generatedAt,
    @Default(true) bool exportable,
  }) = _DischargeReportView;

  factory DischargeReportView.fromJson(Map<String, dynamic> json) =>
      _$DischargeReportViewFromJson(json);
}

@freezed
class AppointmentView with _$AppointmentView {
  const factory AppointmentView({
    required String id,
    required DateTime dateTime,
    required String type,
    required String department,
    @Default(false) bool isNextDose,
  }) = _AppointmentView;

  factory AppointmentView.fromJson(Map<String, dynamic> json) =>
      _$AppointmentViewFromJson(json);
}
