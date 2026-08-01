// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInToken _$CheckInTokenFromJson(Map<String, dynamic> json) {
  return _CheckInToken.fromJson(json);
}

/// @nodoc
mixin _$CheckInToken {
  String get number => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_time')
  DateTime get issueTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_time')
  DateTime? get bookingTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'visible_to_guardian')
  bool get visibleToGuardian => throw _privateConstructorUsedError;

  /// Serializes this CheckInToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInTokenCopyWith<CheckInToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInTokenCopyWith<$Res> {
  factory $CheckInTokenCopyWith(
    CheckInToken value,
    $Res Function(CheckInToken) then,
  ) = _$CheckInTokenCopyWithImpl<$Res, CheckInToken>;
  @useResult
  $Res call({
    String number,
    String department,
    @JsonKey(name: 'issue_time') DateTime issueTime,
    @JsonKey(name: 'booking_time') DateTime? bookingTime,
    String status,
    @JsonKey(name: 'visible_to_guardian') bool visibleToGuardian,
  });
}

/// @nodoc
class _$CheckInTokenCopyWithImpl<$Res, $Val extends CheckInToken>
    implements $CheckInTokenCopyWith<$Res> {
  _$CheckInTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? department = null,
    Object? issueTime = null,
    Object? bookingTime = freezed,
    Object? status = null,
    Object? visibleToGuardian = null,
  }) {
    return _then(
      _value.copyWith(
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as String,
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            issueTime: null == issueTime
                ? _value.issueTime
                : issueTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            bookingTime: freezed == bookingTime
                ? _value.bookingTime
                : bookingTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            visibleToGuardian: null == visibleToGuardian
                ? _value.visibleToGuardian
                : visibleToGuardian // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInTokenImplCopyWith<$Res>
    implements $CheckInTokenCopyWith<$Res> {
  factory _$$CheckInTokenImplCopyWith(
    _$CheckInTokenImpl value,
    $Res Function(_$CheckInTokenImpl) then,
  ) = __$$CheckInTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String number,
    String department,
    @JsonKey(name: 'issue_time') DateTime issueTime,
    @JsonKey(name: 'booking_time') DateTime? bookingTime,
    String status,
    @JsonKey(name: 'visible_to_guardian') bool visibleToGuardian,
  });
}

/// @nodoc
class __$$CheckInTokenImplCopyWithImpl<$Res>
    extends _$CheckInTokenCopyWithImpl<$Res, _$CheckInTokenImpl>
    implements _$$CheckInTokenImplCopyWith<$Res> {
  __$$CheckInTokenImplCopyWithImpl(
    _$CheckInTokenImpl _value,
    $Res Function(_$CheckInTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? department = null,
    Object? issueTime = null,
    Object? bookingTime = freezed,
    Object? status = null,
    Object? visibleToGuardian = null,
  }) {
    return _then(
      _$CheckInTokenImpl(
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as String,
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        issueTime: null == issueTime
            ? _value.issueTime
            : issueTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        bookingTime: freezed == bookingTime
            ? _value.bookingTime
            : bookingTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        visibleToGuardian: null == visibleToGuardian
            ? _value.visibleToGuardian
            : visibleToGuardian // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInTokenImpl implements _CheckInToken {
  const _$CheckInTokenImpl({
    required this.number,
    required this.department,
    @JsonKey(name: 'issue_time') required this.issueTime,
    @JsonKey(name: 'booking_time') this.bookingTime,
    this.status = 'issued',
    @JsonKey(name: 'visible_to_guardian') this.visibleToGuardian = true,
  });

  factory _$CheckInTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInTokenImplFromJson(json);

  @override
  final String number;
  @override
  final String department;
  @override
  @JsonKey(name: 'issue_time')
  final DateTime issueTime;
  @override
  @JsonKey(name: 'booking_time')
  final DateTime? bookingTime;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'visible_to_guardian')
  final bool visibleToGuardian;

  @override
  String toString() {
    return 'CheckInToken(number: $number, department: $department, issueTime: $issueTime, bookingTime: $bookingTime, status: $status, visibleToGuardian: $visibleToGuardian)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInTokenImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.issueTime, issueTime) ||
                other.issueTime == issueTime) &&
            (identical(other.bookingTime, bookingTime) ||
                other.bookingTime == bookingTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.visibleToGuardian, visibleToGuardian) ||
                other.visibleToGuardian == visibleToGuardian));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    number,
    department,
    issueTime,
    bookingTime,
    status,
    visibleToGuardian,
  );

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInTokenImplCopyWith<_$CheckInTokenImpl> get copyWith =>
      __$$CheckInTokenImplCopyWithImpl<_$CheckInTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInTokenImplToJson(this);
  }
}

abstract class _CheckInToken implements CheckInToken {
  const factory _CheckInToken({
    required final String number,
    required final String department,
    @JsonKey(name: 'issue_time') required final DateTime issueTime,
    @JsonKey(name: 'booking_time') final DateTime? bookingTime,
    final String status,
    @JsonKey(name: 'visible_to_guardian') final bool visibleToGuardian,
  }) = _$CheckInTokenImpl;

  factory _CheckInToken.fromJson(Map<String, dynamic> json) =
      _$CheckInTokenImpl.fromJson;

  @override
  String get number;
  @override
  String get department;
  @override
  @JsonKey(name: 'issue_time')
  DateTime get issueTime;
  @override
  @JsonKey(name: 'booking_time')
  DateTime? get bookingTime;
  @override
  String get status;
  @override
  @JsonKey(name: 'visible_to_guardian')
  bool get visibleToGuardian;

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInTokenImplCopyWith<_$CheckInTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CheckInTokenResponse _$CheckInTokenResponseFromJson(Map<String, dynamic> json) {
  return _CheckInTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$CheckInTokenResponse {
  @JsonKey(name: 'patient_file_no')
  String? get patientFileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in_token')
  CheckInToken? get checkInToken => throw _privateConstructorUsedError;

  /// Serializes this CheckInTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInTokenResponseCopyWith<CheckInTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInTokenResponseCopyWith<$Res> {
  factory $CheckInTokenResponseCopyWith(
    CheckInTokenResponse value,
    $Res Function(CheckInTokenResponse) then,
  ) = _$CheckInTokenResponseCopyWithImpl<$Res, CheckInTokenResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'patient_file_no') String? patientFileNo,
    @JsonKey(name: 'check_in_token') CheckInToken? checkInToken,
  });

  $CheckInTokenCopyWith<$Res>? get checkInToken;
}

/// @nodoc
class _$CheckInTokenResponseCopyWithImpl<
  $Res,
  $Val extends CheckInTokenResponse
>
    implements $CheckInTokenResponseCopyWith<$Res> {
  _$CheckInTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patientFileNo = freezed, Object? checkInToken = freezed}) {
    return _then(
      _value.copyWith(
            patientFileNo: freezed == patientFileNo
                ? _value.patientFileNo
                : patientFileNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkInToken: freezed == checkInToken
                ? _value.checkInToken
                : checkInToken // ignore: cast_nullable_to_non_nullable
                      as CheckInToken?,
          )
          as $Val,
    );
  }

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckInTokenCopyWith<$Res>? get checkInToken {
    if (_value.checkInToken == null) {
      return null;
    }

    return $CheckInTokenCopyWith<$Res>(_value.checkInToken!, (value) {
      return _then(_value.copyWith(checkInToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInTokenResponseImplCopyWith<$Res>
    implements $CheckInTokenResponseCopyWith<$Res> {
  factory _$$CheckInTokenResponseImplCopyWith(
    _$CheckInTokenResponseImpl value,
    $Res Function(_$CheckInTokenResponseImpl) then,
  ) = __$$CheckInTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'patient_file_no') String? patientFileNo,
    @JsonKey(name: 'check_in_token') CheckInToken? checkInToken,
  });

  @override
  $CheckInTokenCopyWith<$Res>? get checkInToken;
}

/// @nodoc
class __$$CheckInTokenResponseImplCopyWithImpl<$Res>
    extends _$CheckInTokenResponseCopyWithImpl<$Res, _$CheckInTokenResponseImpl>
    implements _$$CheckInTokenResponseImplCopyWith<$Res> {
  __$$CheckInTokenResponseImplCopyWithImpl(
    _$CheckInTokenResponseImpl _value,
    $Res Function(_$CheckInTokenResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? patientFileNo = freezed, Object? checkInToken = freezed}) {
    return _then(
      _$CheckInTokenResponseImpl(
        patientFileNo: freezed == patientFileNo
            ? _value.patientFileNo
            : patientFileNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkInToken: freezed == checkInToken
            ? _value.checkInToken
            : checkInToken // ignore: cast_nullable_to_non_nullable
                  as CheckInToken?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInTokenResponseImpl implements _CheckInTokenResponse {
  const _$CheckInTokenResponseImpl({
    @JsonKey(name: 'patient_file_no') this.patientFileNo,
    @JsonKey(name: 'check_in_token') this.checkInToken,
  });

  factory _$CheckInTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInTokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'patient_file_no')
  final String? patientFileNo;
  @override
  @JsonKey(name: 'check_in_token')
  final CheckInToken? checkInToken;

  @override
  String toString() {
    return 'CheckInTokenResponse(patientFileNo: $patientFileNo, checkInToken: $checkInToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInTokenResponseImpl &&
            (identical(other.patientFileNo, patientFileNo) ||
                other.patientFileNo == patientFileNo) &&
            (identical(other.checkInToken, checkInToken) ||
                other.checkInToken == checkInToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, patientFileNo, checkInToken);

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInTokenResponseImplCopyWith<_$CheckInTokenResponseImpl>
  get copyWith =>
      __$$CheckInTokenResponseImplCopyWithImpl<_$CheckInTokenResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInTokenResponseImplToJson(this);
  }
}

abstract class _CheckInTokenResponse implements CheckInTokenResponse {
  const factory _CheckInTokenResponse({
    @JsonKey(name: 'patient_file_no') final String? patientFileNo,
    @JsonKey(name: 'check_in_token') final CheckInToken? checkInToken,
  }) = _$CheckInTokenResponseImpl;

  factory _CheckInTokenResponse.fromJson(Map<String, dynamic> json) =
      _$CheckInTokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'patient_file_no')
  String? get patientFileNo;
  @override
  @JsonKey(name: 'check_in_token')
  CheckInToken? get checkInToken;

  /// Create a copy of CheckInTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInTokenResponseImplCopyWith<_$CheckInTokenResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
