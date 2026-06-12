// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StageView _$StageViewFromJson(Map<String, dynamic> json) {
  return _StageView.fromJson(json);
}

/// @nodoc
mixin _$StageView {
  String get name => throw _privateConstructorUsedError;
  StageStatus get status => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get medsSummary => throw _privateConstructorUsedError;
  String? get visitsSummary => throw _privateConstructorUsedError;

  /// Serializes this StageView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StageView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageViewCopyWith<StageView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageViewCopyWith<$Res> {
  factory $StageViewCopyWith(StageView value, $Res Function(StageView) then) =
      _$StageViewCopyWithImpl<$Res, StageView>;
  @useResult
  $Res call({
    String name,
    StageStatus status,
    DateTime? startDate,
    DateTime? endDate,
    String? medsSummary,
    String? visitsSummary,
  });
}

/// @nodoc
class _$StageViewCopyWithImpl<$Res, $Val extends StageView>
    implements $StageViewCopyWith<$Res> {
  _$StageViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StageView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? medsSummary = freezed,
    Object? visitsSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as StageStatus,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            medsSummary: freezed == medsSummary
                ? _value.medsSummary
                : medsSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
            visitsSummary: freezed == visitsSummary
                ? _value.visitsSummary
                : visitsSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StageViewImplCopyWith<$Res>
    implements $StageViewCopyWith<$Res> {
  factory _$$StageViewImplCopyWith(
    _$StageViewImpl value,
    $Res Function(_$StageViewImpl) then,
  ) = __$$StageViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    StageStatus status,
    DateTime? startDate,
    DateTime? endDate,
    String? medsSummary,
    String? visitsSummary,
  });
}

/// @nodoc
class __$$StageViewImplCopyWithImpl<$Res>
    extends _$StageViewCopyWithImpl<$Res, _$StageViewImpl>
    implements _$$StageViewImplCopyWith<$Res> {
  __$$StageViewImplCopyWithImpl(
    _$StageViewImpl _value,
    $Res Function(_$StageViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StageView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? status = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? medsSummary = freezed,
    Object? visitsSummary = freezed,
  }) {
    return _then(
      _$StageViewImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as StageStatus,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        medsSummary: freezed == medsSummary
            ? _value.medsSummary
            : medsSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
        visitsSummary: freezed == visitsSummary
            ? _value.visitsSummary
            : visitsSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StageViewImpl implements _StageView {
  const _$StageViewImpl({
    required this.name,
    required this.status,
    this.startDate,
    this.endDate,
    this.medsSummary,
    this.visitsSummary,
  });

  factory _$StageViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageViewImplFromJson(json);

  @override
  final String name;
  @override
  final StageStatus status;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? medsSummary;
  @override
  final String? visitsSummary;

  @override
  String toString() {
    return 'StageView(name: $name, status: $status, startDate: $startDate, endDate: $endDate, medsSummary: $medsSummary, visitsSummary: $visitsSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageViewImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.medsSummary, medsSummary) ||
                other.medsSummary == medsSummary) &&
            (identical(other.visitsSummary, visitsSummary) ||
                other.visitsSummary == visitsSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    status,
    startDate,
    endDate,
    medsSummary,
    visitsSummary,
  );

  /// Create a copy of StageView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageViewImplCopyWith<_$StageViewImpl> get copyWith =>
      __$$StageViewImplCopyWithImpl<_$StageViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageViewImplToJson(this);
  }
}

abstract class _StageView implements StageView {
  const factory _StageView({
    required final String name,
    required final StageStatus status,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? medsSummary,
    final String? visitsSummary,
  }) = _$StageViewImpl;

  factory _StageView.fromJson(Map<String, dynamic> json) =
      _$StageViewImpl.fromJson;

  @override
  String get name;
  @override
  StageStatus get status;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get medsSummary;
  @override
  String? get visitsSummary;

  /// Create a copy of StageView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageViewImplCopyWith<_$StageViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreatmentPlanView _$TreatmentPlanViewFromJson(Map<String, dynamic> json) {
  return _TreatmentPlanView.fromJson(json);
}

/// @nodoc
mixin _$TreatmentPlanView {
  String get planName => throw _privateConstructorUsedError;
  List<StageView> get stages => throw _privateConstructorUsedError;

  /// Serializes this TreatmentPlanView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentPlanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentPlanViewCopyWith<TreatmentPlanView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentPlanViewCopyWith<$Res> {
  factory $TreatmentPlanViewCopyWith(
    TreatmentPlanView value,
    $Res Function(TreatmentPlanView) then,
  ) = _$TreatmentPlanViewCopyWithImpl<$Res, TreatmentPlanView>;
  @useResult
  $Res call({String planName, List<StageView> stages});
}

/// @nodoc
class _$TreatmentPlanViewCopyWithImpl<$Res, $Val extends TreatmentPlanView>
    implements $TreatmentPlanViewCopyWith<$Res> {
  _$TreatmentPlanViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentPlanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? planName = null, Object? stages = null}) {
    return _then(
      _value.copyWith(
            planName: null == planName
                ? _value.planName
                : planName // ignore: cast_nullable_to_non_nullable
                      as String,
            stages: null == stages
                ? _value.stages
                : stages // ignore: cast_nullable_to_non_nullable
                      as List<StageView>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TreatmentPlanViewImplCopyWith<$Res>
    implements $TreatmentPlanViewCopyWith<$Res> {
  factory _$$TreatmentPlanViewImplCopyWith(
    _$TreatmentPlanViewImpl value,
    $Res Function(_$TreatmentPlanViewImpl) then,
  ) = __$$TreatmentPlanViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String planName, List<StageView> stages});
}

/// @nodoc
class __$$TreatmentPlanViewImplCopyWithImpl<$Res>
    extends _$TreatmentPlanViewCopyWithImpl<$Res, _$TreatmentPlanViewImpl>
    implements _$$TreatmentPlanViewImplCopyWith<$Res> {
  __$$TreatmentPlanViewImplCopyWithImpl(
    _$TreatmentPlanViewImpl _value,
    $Res Function(_$TreatmentPlanViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TreatmentPlanView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? planName = null, Object? stages = null}) {
    return _then(
      _$TreatmentPlanViewImpl(
        planName: null == planName
            ? _value.planName
            : planName // ignore: cast_nullable_to_non_nullable
                  as String,
        stages: null == stages
            ? _value._stages
            : stages // ignore: cast_nullable_to_non_nullable
                  as List<StageView>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentPlanViewImpl implements _TreatmentPlanView {
  const _$TreatmentPlanViewImpl({
    required this.planName,
    final List<StageView> stages = const <StageView>[],
  }) : _stages = stages;

  factory _$TreatmentPlanViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentPlanViewImplFromJson(json);

  @override
  final String planName;
  final List<StageView> _stages;
  @override
  @JsonKey()
  List<StageView> get stages {
    if (_stages is EqualUnmodifiableListView) return _stages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stages);
  }

  @override
  String toString() {
    return 'TreatmentPlanView(planName: $planName, stages: $stages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentPlanViewImpl &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            const DeepCollectionEquality().equals(other._stages, _stages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    planName,
    const DeepCollectionEquality().hash(_stages),
  );

  /// Create a copy of TreatmentPlanView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentPlanViewImplCopyWith<_$TreatmentPlanViewImpl> get copyWith =>
      __$$TreatmentPlanViewImplCopyWithImpl<_$TreatmentPlanViewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentPlanViewImplToJson(this);
  }
}

abstract class _TreatmentPlanView implements TreatmentPlanView {
  const factory _TreatmentPlanView({
    required final String planName,
    final List<StageView> stages,
  }) = _$TreatmentPlanViewImpl;

  factory _TreatmentPlanView.fromJson(Map<String, dynamic> json) =
      _$TreatmentPlanViewImpl.fromJson;

  @override
  String get planName;
  @override
  List<StageView> get stages;

  /// Create a copy of TreatmentPlanView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentPlanViewImplCopyWith<_$TreatmentPlanViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
