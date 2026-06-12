import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';

import 'local_cache.dart';

/// Mock auth — no backend. Any non-empty credentials succeed (after a small
/// simulated latency). Lockout after [maxAttempts] failed attempts. Biometric /
/// device PIN via local_auth for fast re-entry.
class AuthService {
  AuthService(this._cache);
  final LocalCache _cache;
  final LocalAuthentication _localAuth = LocalAuthentication();

  static const int maxAttempts = 5;
  int _failedAttempts = 0;

  bool get isLockedOut => _failedAttempts >= maxAttempts;
  int get remainingAttempts => (maxAttempts - _failedAttempts).clamp(0, maxAttempts);

  bool get isLoggedIn => _cache.isLoggedIn;

  Future<bool> login(String username, String password) async {
    if (isLockedOut) return false;
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final ok = username.trim().isNotEmpty && password.trim().isNotEmpty;
    if (ok) {
      _failedAttempts = 0;
      await _cache.setLoggedIn(true);
    } else {
      _failedAttempts++;
    }
    return ok;
  }

  Future<void> logout() async {
    _failedAttempts = 0;
    await _cache.setLoggedIn(false);
  }

  /// Attempt biometric / device-credential authentication. Returns false (not
  /// an exception) on unsupported devices so the flow degrades gracefully.
  Future<bool> authenticateBiometric() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics ||
          await _localAuth.isDeviceSupported();
      if (!canCheck) return false;
      final ok = await _localAuth.authenticate(
        localizedReason: 'يرجى التحقق للدخول إلى رعاية بسمة',
        biometricOnly: false,
        persistAcrossBackgrounding: true,
      );
      if (ok) await _cache.setLoggedIn(true);
      return ok;
    } catch (e) {
      debugPrint('Biometric auth unavailable: $e');
      return false;
    }
  }
}
