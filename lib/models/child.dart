import 'package:freezed_annotation/freezed_annotation.dart';

part 'child.freezed.dart';
part 'child.g.dart';

/// Read-only, masked, least-privilege view of a child.
/// No life-status / mortality / death-follow-up fields by design.
@freezed
class ChildSummary with _$ChildSummary {
  const factory ChildSummary({
    required String fileNoBasma, // primary; encoded in the check-in QR
    required String firstName,
    required String familyName,
    required int age,
    required String gender,
    required String currentPhase,
    String? photoUrl,
    String? nationalIdMasked, // already masked at source
    String? guardianRelationship,
  }) = _ChildSummary;

  const ChildSummary._();

  factory ChildSummary.fromJson(Map<String, dynamic> json) =>
      _$ChildSummaryFromJson(json);

  String get fullName => '$firstName $familyName';
}

@freezed
class GuardianProfile with _$GuardianProfile {
  const factory GuardianProfile({
    required String id,
    required String name,
    required String relationshipToChild,
    String? contactPhone,
    String? contactEmail,
    @Default(<ChildSummary>[]) List<ChildSummary> children,
  }) = _GuardianProfile;

  factory GuardianProfile.fromJson(Map<String, dynamic> json) =>
      _$GuardianProfileFromJson(json);
}

/// Gentle, parent-friendly summary — not the clinical documentation template.
@freezed
class DiseaseOverview with _$DiseaseOverview {
  const factory DiseaseOverview({
    required String summary,
    String? category,
  }) = _DiseaseOverview;

  factory DiseaseOverview.fromJson(Map<String, dynamic> json) =>
      _$DiseaseOverviewFromJson(json);
}
