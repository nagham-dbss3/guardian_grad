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
  DateTime get issueTime => throw _privateConstructorUsedError;
  DateTime? get bookingTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
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
    DateTime issueTime,
    DateTime? bookingTime,
    String status,
    bool visibleToGuardian,
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
    DateTime issueTime,
    DateTime? bookingTime,
    String status,
    bool visibleToGuardian,
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
    required this.issueTime,
    this.bookingTime,
    this.status = 'issued',
    this.visibleToGuardian = true,
  });

  factory _$CheckInTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInTokenImplFromJson(json);

  @override
  final String number;
  @override
  final String department;
  @override
  final DateTime issueTime;
  @override
  final DateTime? bookingTime;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
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
    required final DateTime issueTime,
    final DateTime? bookingTime,
    final String status,
    final bool visibleToGuardian,
  }) = _$CheckInTokenImpl;

  factory _CheckInToken.fromJson(Map<String, dynamic> json) =
      _$CheckInTokenImpl.fromJson;

  @override
  String get number;
  @override
  String get department;
  @override
  DateTime get issueTime;
  @override
  DateTime? get bookingTime;
  @override
  String get status;
  @override
  bool get visibleToGuardian;

  /// Create a copy of CheckInToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInTokenImplCopyWith<_$CheckInTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
