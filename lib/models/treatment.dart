import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatment.freezed.dart';
part 'treatment.g.dart';

enum StageStatus {
  @JsonValue('completed')
  completed,
  @JsonValue('current')
  current,
  @JsonValue('upcoming')
  upcoming,
}

@freezed
class StageView with _$StageView {
  const factory StageView({
    required String name,
    required StageStatus status,
    DateTime? startDate,
    DateTime? endDate,
    String? medsSummary,
    String? visitsSummary,
  }) = _StageView;

  factory StageView.fromJson(Map<String, dynamic> json) =>
      _$StageViewFromJson(json);
}

@freezed
class TreatmentPlanView with _$TreatmentPlanView {
  const factory TreatmentPlanView({
    required String planName,
    @Default(<StageView>[]) List<StageView> stages,
  }) = _TreatmentPlanView;

  factory TreatmentPlanView.fromJson(Map<String, dynamic> json) =>
      _$TreatmentPlanViewFromJson(json);
}
