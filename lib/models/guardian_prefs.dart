import 'package:freezed_annotation/freezed_annotation.dart';

part 'guardian_prefs.freezed.dart';
part 'guardian_prefs.g.dart';

/// Local-only user preferences (the only writable state in the app).
@freezed
class GuardianPrefs with _$GuardianPrefs {
  const factory GuardianPrefs({
    @Default(true) bool doseReminders,
    @Default(true) bool resultAlerts,
    @Default(true) bool biometricEnabled,
  }) = _GuardianPrefs;

  factory GuardianPrefs.fromJson(Map<String, dynamic> json) =>
      _$GuardianPrefsFromJson(json);
}
