import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin.freezed.dart';
part 'checkin.g.dart';

/// The QR encodes [ChildSummary.fileNoBasma]; this token provides the number /
/// time to display alongside it. Reception scans the QR to check the child in.
///
/// Accepts both snake_case (`/check-in-token`) and camelCase (`/record`).
@freezed
class CheckInToken with _$CheckInToken {
  const factory CheckInToken({
    required String number,
    required String department,
    @JsonKey(name: 'issue_time') required DateTime issueTime,
    @JsonKey(name: 'booking_time') DateTime? bookingTime,
    @Default('issued') String status,
    @JsonKey(name: 'visible_to_guardian') @Default(true) bool visibleToGuardian,
  }) = _CheckInToken;

  factory CheckInToken.fromJson(Map<String, dynamic> json) =>
      _$CheckInTokenFromJson(_normalizeCheckInJson(json));
}

Map<String, dynamic> _normalizeCheckInJson(Map<String, dynamic> json) {
  final map = Map<String, dynamic>.from(json);
  map['issue_time'] ??= map['issueTime'];
  map['booking_time'] ??= map['bookingTime'];
  map['visible_to_guardian'] ??= map['visibleToGuardian'];
  return map;
}

/// Wrapper for `GET /guardian/children/{fileNo}/check-in-token` (snake_case).
@freezed
class CheckInTokenResponse with _$CheckInTokenResponse {
  const factory CheckInTokenResponse({
    @JsonKey(name: 'patient_file_no') String? patientFileNo,
    @JsonKey(name: 'check_in_token') CheckInToken? checkInToken,
  }) = _CheckInTokenResponse;

  factory CheckInTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckInTokenResponseFromJson(json);
}
