import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/utils/json_converters.dart';

part 'child.freezed.dart';
part 'child.g.dart';

/// Read-only, masked, least-privilege view of a child.
/// No life-status / mortality / death-follow-up fields by design.
/// JSON keys match the camelCase `/guardian/*` API contract.
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

/// Guardian profile as returned by `GET /guardian/me`.
@freezed
class GuardianProfile with _$GuardianProfile {
  const factory GuardianProfile({
    @FlexibleStringConverter() required String id,
    required String name,
    required String relationshipToChild,
    String? contactPhone,
    String? contactEmail,
    @Default(<ChildSummary>[]) List<ChildSummary> children,
  }) = _GuardianProfile;

  factory GuardianProfile.fromJson(Map<String, dynamic> json) =>
      _$GuardianProfileFromJson(json);
}

/// Wrapper for `GET /guardian/children`.
@freezed
class ChildrenListResponse with _$ChildrenListResponse {
  const factory ChildrenListResponse({
    @Default(<ChildSummary>[]) List<ChildSummary> children,
  }) = _ChildrenListResponse;

  factory ChildrenListResponse.fromJson(Map<String, dynamic> json) =>
      _$ChildrenListResponseFromJson(json);
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
