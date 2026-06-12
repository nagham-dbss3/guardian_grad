import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkin.freezed.dart';
part 'checkin.g.dart';

/// The QR encodes [ChildSummary.fileNoBasma]; this token provides the number /
/// time to display alongside it. Reception scans the QR to check the child in.
@freezed
class CheckInToken with _$CheckInToken {
  const factory CheckInToken({
    required String number,
    required String department,
    required DateTime issueTime,
    DateTime? bookingTime,
    @Default('issued') String status,
    @Default(true) bool visibleToGuardian,
  }) = _CheckInToken;

  factory CheckInToken.fromJson(Map<String, dynamic> json) =>
      _$CheckInTokenFromJson(json);
}
