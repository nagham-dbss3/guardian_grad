// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DisplayQueueToken _$DisplayQueueTokenFromJson(Map<String, dynamic> json) {
  return _DisplayQueueToken.fromJson(json);
}

/// @nodoc
mixin _$DisplayQueueToken {
  @FlexibleStringConverter()
  String get id => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_emergency')
  bool get isEmergency => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_time')
  @RequiredDateTimeConverter()
  DateTime get issueTime => throw _privateConstructorUsedError;

  /// Serializes this DisplayQueueToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplayQueueToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayQueueTokenCopyWith<DisplayQueueToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayQueueTokenCopyWith<$Res> {
  factory $DisplayQueueTokenCopyWith(
    DisplayQueueToken value,
    $Res Function(DisplayQueueToken) then,
  ) = _$DisplayQueueTokenCopyWithImpl<$Res, DisplayQueueToken>;
  @useResult
  $Res call({
    @FlexibleStringConverter() String id,
    String number,
    String status,
    @JsonKey(name: 'is_emergency') bool isEmergency,
    @JsonKey(name: 'issue_time')
    @RequiredDateTimeConverter()
    DateTime issueTime,
  });
}

/// @nodoc
class _$DisplayQueueTokenCopyWithImpl<$Res, $Val extends DisplayQueueToken>
    implements $DisplayQueueTokenCopyWith<$Res> {
  _$DisplayQueueTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayQueueToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? status = null,
    Object? isEmergency = null,
    Object? issueTime = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isEmergency: null == isEmergency
                ? _value.isEmergency
                : isEmergency // ignore: cast_nullable_to_non_nullable
                      as bool,
            issueTime: null == issueTime
                ? _value.issueTime
                : issueTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DisplayQueueTokenImplCopyWith<$Res>
    implements $DisplayQueueTokenCopyWith<$Res> {
  factory _$$DisplayQueueTokenImplCopyWith(
    _$DisplayQueueTokenImpl value,
    $Res Function(_$DisplayQueueTokenImpl) then,
  ) = __$$DisplayQueueTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @FlexibleStringConverter() String id,
    String number,
    String status,
    @JsonKey(name: 'is_emergency') bool isEmergency,
    @JsonKey(name: 'issue_time')
    @RequiredDateTimeConverter()
    DateTime issueTime,
  });
}

/// @nodoc
class __$$DisplayQueueTokenImplCopyWithImpl<$Res>
    extends _$DisplayQueueTokenCopyWithImpl<$Res, _$DisplayQueueTokenImpl>
    implements _$$DisplayQueueTokenImplCopyWith<$Res> {
  __$$DisplayQueueTokenImplCopyWithImpl(
    _$DisplayQueueTokenImpl _value,
    $Res Function(_$DisplayQueueTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisplayQueueToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? status = null,
    Object? isEmergency = null,
    Object? issueTime = null,
  }) {
    return _then(
      _$DisplayQueueTokenImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isEmergency: null == isEmergency
            ? _value.isEmergency
            : isEmergency // ignore: cast_nullable_to_non_nullable
                  as bool,
        issueTime: null == issueTime
            ? _value.issueTime
            : issueTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayQueueTokenImpl implements _DisplayQueueToken {
  const _$DisplayQueueTokenImpl({
    @FlexibleStringConverter() required this.id,
    required this.number,
    required this.status,
    @JsonKey(name: 'is_emergency') this.isEmergency = false,
    @JsonKey(name: 'issue_time')
    @RequiredDateTimeConverter()
    required this.issueTime,
  });

  factory _$DisplayQueueTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayQueueTokenImplFromJson(json);

  @override
  @FlexibleStringConverter()
  final String id;
  @override
  final String number;
  @override
  final String status;
  @override
  @JsonKey(name: 'is_emergency')
  final bool isEmergency;
  @override
  @JsonKey(name: 'issue_time')
  @RequiredDateTimeConverter()
  final DateTime issueTime;

  @override
  String toString() {
    return 'DisplayQueueToken(id: $id, number: $number, status: $status, isEmergency: $isEmergency, issueTime: $issueTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayQueueTokenImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isEmergency, isEmergency) ||
                other.isEmergency == isEmergency) &&
            (identical(other.issueTime, issueTime) ||
                other.issueTime == issueTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, number, status, isEmergency, issueTime);

  /// Create a copy of DisplayQueueToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayQueueTokenImplCopyWith<_$DisplayQueueTokenImpl> get copyWith =>
      __$$DisplayQueueTokenImplCopyWithImpl<_$DisplayQueueTokenImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayQueueTokenImplToJson(this);
  }
}

abstract class _DisplayQueueToken implements DisplayQueueToken {
  const factory _DisplayQueueToken({
    @FlexibleStringConverter() required final String id,
    required final String number,
    required final String status,
    @JsonKey(name: 'is_emergency') final bool isEmergency,
    @JsonKey(name: 'issue_time')
    @RequiredDateTimeConverter()
    required final DateTime issueTime,
  }) = _$DisplayQueueTokenImpl;

  factory _DisplayQueueToken.fromJson(Map<String, dynamic> json) =
      _$DisplayQueueTokenImpl.fromJson;

  @override
  @FlexibleStringConverter()
  String get id;
  @override
  String get number;
  @override
  String get status;
  @override
  @JsonKey(name: 'is_emergency')
  bool get isEmergency;
  @override
  @JsonKey(name: 'issue_time')
  @RequiredDateTimeConverter()
  DateTime get issueTime;

  /// Create a copy of DisplayQueueToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayQueueTokenImplCopyWith<_$DisplayQueueTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DisplayDepartmentQueue _$DisplayDepartmentQueueFromJson(
  Map<String, dynamic> json,
) {
  return _DisplayDepartmentQueue.fromJson(json);
}

/// @nodoc
mixin _$DisplayDepartmentQueue {
  String get department => throw _privateConstructorUsedError;
  List<DisplayQueueToken> get tokens => throw _privateConstructorUsedError;

  /// Serializes this DisplayDepartmentQueue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplayDepartmentQueue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayDepartmentQueueCopyWith<DisplayDepartmentQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayDepartmentQueueCopyWith<$Res> {
  factory $DisplayDepartmentQueueCopyWith(
    DisplayDepartmentQueue value,
    $Res Function(DisplayDepartmentQueue) then,
  ) = _$DisplayDepartmentQueueCopyWithImpl<$Res, DisplayDepartmentQueue>;
  @useResult
  $Res call({String department, List<DisplayQueueToken> tokens});
}

/// @nodoc
class _$DisplayDepartmentQueueCopyWithImpl<
  $Res,
  $Val extends DisplayDepartmentQueue
>
    implements $DisplayDepartmentQueueCopyWith<$Res> {
  _$DisplayDepartmentQueueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayDepartmentQueue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? department = null, Object? tokens = null}) {
    return _then(
      _value.copyWith(
            department: null == department
                ? _value.department
                : department // ignore: cast_nullable_to_non_nullable
                      as String,
            tokens: null == tokens
                ? _value.tokens
                : tokens // ignore: cast_nullable_to_non_nullable
                      as List<DisplayQueueToken>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DisplayDepartmentQueueImplCopyWith<$Res>
    implements $DisplayDepartmentQueueCopyWith<$Res> {
  factory _$$DisplayDepartmentQueueImplCopyWith(
    _$DisplayDepartmentQueueImpl value,
    $Res Function(_$DisplayDepartmentQueueImpl) then,
  ) = __$$DisplayDepartmentQueueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String department, List<DisplayQueueToken> tokens});
}

/// @nodoc
class __$$DisplayDepartmentQueueImplCopyWithImpl<$Res>
    extends
        _$DisplayDepartmentQueueCopyWithImpl<$Res, _$DisplayDepartmentQueueImpl>
    implements _$$DisplayDepartmentQueueImplCopyWith<$Res> {
  __$$DisplayDepartmentQueueImplCopyWithImpl(
    _$DisplayDepartmentQueueImpl _value,
    $Res Function(_$DisplayDepartmentQueueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisplayDepartmentQueue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? department = null, Object? tokens = null}) {
    return _then(
      _$DisplayDepartmentQueueImpl(
        department: null == department
            ? _value.department
            : department // ignore: cast_nullable_to_non_nullable
                  as String,
        tokens: null == tokens
            ? _value._tokens
            : tokens // ignore: cast_nullable_to_non_nullable
                  as List<DisplayQueueToken>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayDepartmentQueueImpl extends _DisplayDepartmentQueue {
  const _$DisplayDepartmentQueueImpl({
    required this.department,
    final List<DisplayQueueToken> tokens = const <DisplayQueueToken>[],
  }) : _tokens = tokens,
       super._();

  factory _$DisplayDepartmentQueueImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayDepartmentQueueImplFromJson(json);

  @override
  final String department;
  final List<DisplayQueueToken> _tokens;
  @override
  @JsonKey()
  List<DisplayQueueToken> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  String toString() {
    return 'DisplayDepartmentQueue(department: $department, tokens: $tokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayDepartmentQueueImpl &&
            (identical(other.department, department) ||
                other.department == department) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    department,
    const DeepCollectionEquality().hash(_tokens),
  );

  /// Create a copy of DisplayDepartmentQueue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayDepartmentQueueImplCopyWith<_$DisplayDepartmentQueueImpl>
  get copyWith =>
      __$$DisplayDepartmentQueueImplCopyWithImpl<_$DisplayDepartmentQueueImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayDepartmentQueueImplToJson(this);
  }
}

abstract class _DisplayDepartmentQueue extends DisplayDepartmentQueue {
  const factory _DisplayDepartmentQueue({
    required final String department,
    final List<DisplayQueueToken> tokens,
  }) = _$DisplayDepartmentQueueImpl;
  const _DisplayDepartmentQueue._() : super._();

  factory _DisplayDepartmentQueue.fromJson(Map<String, dynamic> json) =
      _$DisplayDepartmentQueueImpl.fromJson;

  @override
  String get department;
  @override
  List<DisplayQueueToken> get tokens;

  /// Create a copy of DisplayDepartmentQueue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayDepartmentQueueImplCopyWith<_$DisplayDepartmentQueueImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DisplayQueuesResponse _$DisplayQueuesResponseFromJson(
  Map<String, dynamic> json,
) {
  return _DisplayQueuesResponse.fromJson(json);
}

/// @nodoc
mixin _$DisplayQueuesResponse {
  List<DisplayDepartmentQueue> get departments =>
      throw _privateConstructorUsedError;

  /// Serializes this DisplayQueuesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DisplayQueuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DisplayQueuesResponseCopyWith<DisplayQueuesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayQueuesResponseCopyWith<$Res> {
  factory $DisplayQueuesResponseCopyWith(
    DisplayQueuesResponse value,
    $Res Function(DisplayQueuesResponse) then,
  ) = _$DisplayQueuesResponseCopyWithImpl<$Res, DisplayQueuesResponse>;
  @useResult
  $Res call({List<DisplayDepartmentQueue> departments});
}

/// @nodoc
class _$DisplayQueuesResponseCopyWithImpl<
  $Res,
  $Val extends DisplayQueuesResponse
>
    implements $DisplayQueuesResponseCopyWith<$Res> {
  _$DisplayQueuesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DisplayQueuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? departments = null}) {
    return _then(
      _value.copyWith(
            departments: null == departments
                ? _value.departments
                : departments // ignore: cast_nullable_to_non_nullable
                      as List<DisplayDepartmentQueue>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DisplayQueuesResponseImplCopyWith<$Res>
    implements $DisplayQueuesResponseCopyWith<$Res> {
  factory _$$DisplayQueuesResponseImplCopyWith(
    _$DisplayQueuesResponseImpl value,
    $Res Function(_$DisplayQueuesResponseImpl) then,
  ) = __$$DisplayQueuesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DisplayDepartmentQueue> departments});
}

/// @nodoc
class __$$DisplayQueuesResponseImplCopyWithImpl<$Res>
    extends
        _$DisplayQueuesResponseCopyWithImpl<$Res, _$DisplayQueuesResponseImpl>
    implements _$$DisplayQueuesResponseImplCopyWith<$Res> {
  __$$DisplayQueuesResponseImplCopyWithImpl(
    _$DisplayQueuesResponseImpl _value,
    $Res Function(_$DisplayQueuesResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DisplayQueuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? departments = null}) {
    return _then(
      _$DisplayQueuesResponseImpl(
        departments: null == departments
            ? _value._departments
            : departments // ignore: cast_nullable_to_non_nullable
                  as List<DisplayDepartmentQueue>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DisplayQueuesResponseImpl implements _DisplayQueuesResponse {
  const _$DisplayQueuesResponseImpl({
    final List<DisplayDepartmentQueue> departments =
        const <DisplayDepartmentQueue>[],
  }) : _departments = departments;

  factory _$DisplayQueuesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DisplayQueuesResponseImplFromJson(json);

  final List<DisplayDepartmentQueue> _departments;
  @override
  @JsonKey()
  List<DisplayDepartmentQueue> get departments {
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_departments);
  }

  @override
  String toString() {
    return 'DisplayQueuesResponse(departments: $departments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplayQueuesResponseImpl &&
            const DeepCollectionEquality().equals(
              other._departments,
              _departments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_departments),
  );

  /// Create a copy of DisplayQueuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplayQueuesResponseImplCopyWith<_$DisplayQueuesResponseImpl>
  get copyWith =>
      __$$DisplayQueuesResponseImplCopyWithImpl<_$DisplayQueuesResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DisplayQueuesResponseImplToJson(this);
  }
}

abstract class _DisplayQueuesResponse implements DisplayQueuesResponse {
  const factory _DisplayQueuesResponse({
    final List<DisplayDepartmentQueue> departments,
  }) = _$DisplayQueuesResponseImpl;

  factory _DisplayQueuesResponse.fromJson(Map<String, dynamic> json) =
      _$DisplayQueuesResponseImpl.fromJson;

  @override
  List<DisplayDepartmentQueue> get departments;

  /// Create a copy of DisplayQueuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DisplayQueuesResponseImplCopyWith<_$DisplayQueuesResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
