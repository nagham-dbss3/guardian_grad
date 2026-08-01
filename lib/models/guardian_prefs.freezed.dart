// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guardian_prefs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GuardianPrefs _$GuardianPrefsFromJson(Map<String, dynamic> json) {
  return _GuardianPrefs.fromJson(json);
}

/// @nodoc
mixin _$GuardianPrefs {
  bool get doseReminders => throw _privateConstructorUsedError;
  bool get resultAlerts => throw _privateConstructorUsedError;

  /// Serializes this GuardianPrefs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GuardianPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuardianPrefsCopyWith<GuardianPrefs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardianPrefsCopyWith<$Res> {
  factory $GuardianPrefsCopyWith(
    GuardianPrefs value,
    $Res Function(GuardianPrefs) then,
  ) = _$GuardianPrefsCopyWithImpl<$Res, GuardianPrefs>;
  @useResult
  $Res call({bool doseReminders, bool resultAlerts});
}

/// @nodoc
class _$GuardianPrefsCopyWithImpl<$Res, $Val extends GuardianPrefs>
    implements $GuardianPrefsCopyWith<$Res> {
  _$GuardianPrefsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GuardianPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? doseReminders = null, Object? resultAlerts = null}) {
    return _then(
      _value.copyWith(
            doseReminders: null == doseReminders
                ? _value.doseReminders
                : doseReminders // ignore: cast_nullable_to_non_nullable
                      as bool,
            resultAlerts: null == resultAlerts
                ? _value.resultAlerts
                : resultAlerts // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GuardianPrefsImplCopyWith<$Res>
    implements $GuardianPrefsCopyWith<$Res> {
  factory _$$GuardianPrefsImplCopyWith(
    _$GuardianPrefsImpl value,
    $Res Function(_$GuardianPrefsImpl) then,
  ) = __$$GuardianPrefsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool doseReminders, bool resultAlerts});
}

/// @nodoc
class __$$GuardianPrefsImplCopyWithImpl<$Res>
    extends _$GuardianPrefsCopyWithImpl<$Res, _$GuardianPrefsImpl>
    implements _$$GuardianPrefsImplCopyWith<$Res> {
  __$$GuardianPrefsImplCopyWithImpl(
    _$GuardianPrefsImpl _value,
    $Res Function(_$GuardianPrefsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GuardianPrefs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? doseReminders = null, Object? resultAlerts = null}) {
    return _then(
      _$GuardianPrefsImpl(
        doseReminders: null == doseReminders
            ? _value.doseReminders
            : doseReminders // ignore: cast_nullable_to_non_nullable
                  as bool,
        resultAlerts: null == resultAlerts
            ? _value.resultAlerts
            : resultAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GuardianPrefsImpl implements _GuardianPrefs {
  const _$GuardianPrefsImpl({
    this.doseReminders = true,
    this.resultAlerts = true,
  });

  factory _$GuardianPrefsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GuardianPrefsImplFromJson(json);

  @override
  @JsonKey()
  final bool doseReminders;
  @override
  @JsonKey()
  final bool resultAlerts;

  @override
  String toString() {
    return 'GuardianPrefs(doseReminders: $doseReminders, resultAlerts: $resultAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuardianPrefsImpl &&
            (identical(other.doseReminders, doseReminders) ||
                other.doseReminders == doseReminders) &&
            (identical(other.resultAlerts, resultAlerts) ||
                other.resultAlerts == resultAlerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, doseReminders, resultAlerts);

  /// Create a copy of GuardianPrefs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuardianPrefsImplCopyWith<_$GuardianPrefsImpl> get copyWith =>
      __$$GuardianPrefsImplCopyWithImpl<_$GuardianPrefsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GuardianPrefsImplToJson(this);
  }
}

abstract class _GuardianPrefs implements GuardianPrefs {
  const factory _GuardianPrefs({
    final bool doseReminders,
    final bool resultAlerts,
  }) = _$GuardianPrefsImpl;

  factory _GuardianPrefs.fromJson(Map<String, dynamic> json) =
      _$GuardianPrefsImpl.fromJson;

  @override
  bool get doseReminders;
  @override
  bool get resultAlerts;

  /// Create a copy of GuardianPrefs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuardianPrefsImplCopyWith<_$GuardianPrefsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
