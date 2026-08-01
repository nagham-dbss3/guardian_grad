// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_activity')
  String? get lastActivity => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'full_name') String fullName,
    String email,
    String role,
    String status,
    List<String> permissions,
    @JsonKey(name: 'last_activity') String? lastActivity,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? permissions = null,
    Object? lastActivity = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            permissions: null == permissions
                ? _value.permissions
                : permissions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lastActivity: freezed == lastActivity
                ? _value.lastActivity
                : lastActivity // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    @JsonKey(name: 'full_name') String fullName,
    String email,
    String role,
    String status,
    List<String> permissions,
    @JsonKey(name: 'last_activity') String? lastActivity,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? fullName = null,
    Object? email = null,
    Object? role = null,
    Object? status = null,
    Object? permissions = null,
    Object? lastActivity = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        permissions: null == permissions
            ? _value._permissions
            : permissions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lastActivity: freezed == lastActivity
            ? _value.lastActivity
            : lastActivity // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    @JsonKey(name: 'full_name') required this.fullName,
    required this.email,
    required this.role,
    required this.status,
    final List<String> permissions = const <String>[],
    @JsonKey(name: 'last_activity') this.lastActivity,
  }) : _permissions = permissions;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String email;
  @override
  final String role;
  @override
  final String status;
  final List<String> _permissions;
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  @JsonKey(name: 'last_activity')
  final String? lastActivity;

  @override
  String toString() {
    return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, email: $email, role: $role, status: $status, permissions: $permissions, lastActivity: $lastActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._permissions,
              _permissions,
            ) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    fullName,
    email,
    role,
    status,
    const DeepCollectionEquality().hash(_permissions),
    lastActivity,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final int id,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    @JsonKey(name: 'full_name') required final String fullName,
    required final String email,
    required final String role,
    required final String status,
    final List<String> permissions,
    @JsonKey(name: 'last_activity') final String? lastActivity,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String get email;
  @override
  String get role;
  @override
  String get status;
  @override
  List<String> get permissions;
  @override
  @JsonKey(name: 'last_activity')
  String? get lastActivity;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthResultModel _$AuthResultModelFromJson(Map<String, dynamic> json) {
  return _AuthResultModel.fromJson(json);
}

/// @nodoc
mixin _$AuthResultModel {
  UserModel get user => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  /// Serializes this AuthResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthResultModelCopyWith<AuthResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultModelCopyWith<$Res> {
  factory $AuthResultModelCopyWith(
    AuthResultModel value,
    $Res Function(AuthResultModel) then,
  ) = _$AuthResultModelCopyWithImpl<$Res, AuthResultModel>;
  @useResult
  $Res call({UserModel user, String token});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthResultModelCopyWithImpl<$Res, $Val extends AuthResultModel>
    implements $AuthResultModelCopyWith<$Res> {
  _$AuthResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? token = null}) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserModel,
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthResultModelImplCopyWith<$Res>
    implements $AuthResultModelCopyWith<$Res> {
  factory _$$AuthResultModelImplCopyWith(
    _$AuthResultModelImpl value,
    $Res Function(_$AuthResultModelImpl) then,
  ) = __$$AuthResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserModel user, String token});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthResultModelImplCopyWithImpl<$Res>
    extends _$AuthResultModelCopyWithImpl<$Res, _$AuthResultModelImpl>
    implements _$$AuthResultModelImplCopyWith<$Res> {
  __$$AuthResultModelImplCopyWithImpl(
    _$AuthResultModelImpl _value,
    $Res Function(_$AuthResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null, Object? token = null}) {
    return _then(
      _$AuthResultModelImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserModel,
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthResultModelImpl implements _AuthResultModel {
  const _$AuthResultModelImpl({required this.user, required this.token});

  factory _$AuthResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthResultModelImplFromJson(json);

  @override
  final UserModel user;
  @override
  final String token;

  @override
  String toString() {
    return 'AuthResultModel(user: $user, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthResultModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthResultModelImplCopyWith<_$AuthResultModelImpl> get copyWith =>
      __$$AuthResultModelImplCopyWithImpl<_$AuthResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthResultModelImplToJson(this);
  }
}

abstract class _AuthResultModel implements AuthResultModel {
  const factory _AuthResultModel({
    required final UserModel user,
    required final String token,
  }) = _$AuthResultModelImpl;

  factory _AuthResultModel.fromJson(Map<String, dynamic> json) =
      _$AuthResultModelImpl.fromJson;

  @override
  UserModel get user;
  @override
  String get token;

  /// Create a copy of AuthResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthResultModelImplCopyWith<_$AuthResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
