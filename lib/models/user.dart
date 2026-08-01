import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Authenticated user as returned by `/auth/login` and `/auth/me`.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'full_name') required String fullName,
    required String email,
    required String role,
    required String status,
    @Default(<String>[]) List<String> permissions,
    @JsonKey(name: 'last_activity') String? lastActivity,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

/// Login response payload: authenticated [user] + bearer [token].
@freezed
class AuthResultModel with _$AuthResultModel {
  const factory AuthResultModel({
    required UserModel user,
    required String token,
  }) = _AuthResultModel;

  factory AuthResultModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResultModelFromJson(json);
}
