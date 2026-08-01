import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/utils/json_converters.dart';

part 'display_queue.freezed.dart';
part 'display_queue.g.dart';

/// Single token on a public display board (`GET /display/queues`, snake_case).
@freezed
class DisplayQueueToken with _$DisplayQueueToken {
  const factory DisplayQueueToken({
    @FlexibleStringConverter() required String id,
    required String number,
    required String status,
    @JsonKey(name: 'is_emergency') @Default(false) bool isEmergency,
    @JsonKey(name: 'issue_time')
    @RequiredDateTimeConverter()
    required DateTime issueTime,
  }) = _DisplayQueueToken;

  factory DisplayQueueToken.fromJson(Map<String, dynamic> json) =>
      _$DisplayQueueTokenFromJson(json);
}

/// One department lane with its live tokens.
@freezed
class DisplayDepartmentQueue with _$DisplayDepartmentQueue {
  const factory DisplayDepartmentQueue({
    required String department,
    @Default(<DisplayQueueToken>[]) List<DisplayQueueToken> tokens,
  }) = _DisplayDepartmentQueue;

  const DisplayDepartmentQueue._();

  factory DisplayDepartmentQueue.fromJson(Map<String, dynamic> json) =>
      _$DisplayDepartmentQueueFromJson(json);

  /// Arabic label for known department codes from `GET /display/queues`.
  String get departmentLabelAr {
    switch (department.toLowerCase()) {
      case 'clinic':
        return 'عيادة خارجية';
      case 'daycare':
        return 'مستشفى نهاري';
      case 'inpatient':
        return 'قسم داخلي';
      default:
        return department;
    }
  }
}

/// Wrapper for `GET /display/queues`.
@freezed
class DisplayQueuesResponse with _$DisplayQueuesResponse {
  const factory DisplayQueuesResponse({
    @Default(<DisplayDepartmentQueue>[])
    List<DisplayDepartmentQueue> departments,
  }) = _DisplayQueuesResponse;

  factory DisplayQueuesResponse.fromJson(Map<String, dynamic> json) =>
      _$DisplayQueuesResponseFromJson(json);
}

/// Alias matching product docs.
typedef DisplayQueueModel = DisplayQueuesResponse;
