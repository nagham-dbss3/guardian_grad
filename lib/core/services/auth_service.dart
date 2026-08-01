import '../../features/auth/data/auth_repository.dart';
import '../../models/user.dart';
import 'local_cache.dart';

/// Authentication façade used by the UI (real API login/logout).
class AuthService {
  AuthService(this._repo, {LocalCache? cache})
      : _cache = cache ?? LocalCache.instance;

  final AuthRepository _repo;
  final LocalCache _cache;

  static const int maxAttempts = 5;
  int _failedAttempts = 0;
  String? _lastError;

  bool get isLockedOut => _failedAttempts >= maxAttempts;
  int get remainingAttempts =>
      (maxAttempts - _failedAttempts).clamp(0, maxAttempts);

  bool get isLoggedIn => _cache.isLoggedIn;
  UserModel? get currentUser => _repo.currentUser;
  String? get lastError => _lastError;

  /// Restores a persisted session at app startup (token + optional `/auth/me`).
  Future<UserModel?> restoreSession() => _repo.restoreSession();

  /// Authenticates against `POST /auth/login`. Returns `true` on success.
  /// On failure, [lastError] holds an Arabic message for the login screen.
  Future<bool> login(String emailOrPhone, String password) async {
    _lastError = null;
    if (isLockedOut) {
      _lastError = 'تم إيقاف الدخول مؤقتًا. حاولوا لاحقًا.';
      return false;
    }

    final trimmed = emailOrPhone.trim();
    if (trimmed.isEmpty || password.isEmpty) {
      _failedAttempts++;
      _lastError = 'يرجى إدخال البريد الإلكتروني وكلمة المرور.';
      return false;
    }

    try {
      await _repo.login(email: trimmed, password: password);
      _failedAttempts = 0;
      _lastError = null;
      return true;
    } on AuthFailure catch (e) {
      _failedAttempts++;
      _lastError = e.message;
      return false;
    } catch (e) {
      _failedAttempts++;
      _lastError = 'حدث خطأ غير متوقع. حاولوا مرة أخرى.';
      return false;
    }
  }

  Future<void> logout() async {
    _failedAttempts = 0;
    _lastError = null;
    await _repo.logout();
  }
}
