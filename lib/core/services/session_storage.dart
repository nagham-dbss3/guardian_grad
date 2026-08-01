import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../models/user.dart';
import 'local_cache.dart';

/// Persists the auth token and user profile for session continuity.
///
/// Prefers [FlutterSecureStorage] for the token. If the native plugin is
/// missing (hot-restart after adding the package, or platform gap), falls
/// back to Hive so bootstrap never crashes with a white screen.
class SessionStorage {
  SessionStorage._();
  static final SessionStorage instance = SessionStorage._();

  static const _kToken = 'auth_token';

  final FlutterSecureStorage _secure = const FlutterSecureStorage();

  LocalCache get _cache => LocalCache.instance;

  String? _tokenMemory;
  bool _secureAvailable = true;

  Future<void> init() async {
    try {
      _tokenMemory = await _secure.read(key: _kToken);
      _secureAvailable = true;
    } on MissingPluginException catch (e) {
      _secureAvailable = false;
      debugPrint(
        'Secure storage plugin missing — using Hive token fallback. '
        'Do a full restart (flutter run), not hot reload. ($e)',
      );
      _tokenMemory = _cache.loadAuthToken();
    } catch (e) {
      _secureAvailable = false;
      debugPrint('Secure storage read failed — Hive fallback. ($e)');
      _tokenMemory = _cache.loadAuthToken();
    }

    // Prefer Hive copy if secure store was empty (e.g. after plugin recovery).
    if ((_tokenMemory == null || _tokenMemory!.isEmpty)) {
      final hiveToken = _cache.loadAuthToken();
      if (hiveToken != null && hiveToken.isNotEmpty) {
        _tokenMemory = hiveToken;
      }
    }

    // Keep router flag in sync with a locally available token.
    if (hasToken && !_cache.isLoggedIn) {
      await _cache.setLoggedIn(true);
    }
  }

  String? get token => _tokenMemory;

  bool get hasToken => _tokenMemory != null && _tokenMemory!.isNotEmpty;

  UserModel? get currentUser => _cache.loadAuthUser();

  Future<void> saveSession({
    required String token,
    required UserModel user,
  }) async {
    _tokenMemory = token;
    await _writeToken(token);
    // Always mirror into Hive so session survives plugin gaps.
    await _cache.saveAuthToken(token);
    await _cache.saveAuthUser(user);
    await _cache.setLoggedIn(true);
  }

  Future<void> updateUser(UserModel user) async {
    await _cache.saveAuthUser(user);
  }

  Future<void> clear() async {
    _tokenMemory = null;
    await _deleteToken();
    await _cache.clearAuthToken();
    await _cache.clearAuthUser();
    await _cache.setLoggedIn(false);
  }

  Future<void> _writeToken(String token) async {
    if (!_secureAvailable) return;
    try {
      await _secure.write(key: _kToken, value: token);
    } on MissingPluginException {
      _secureAvailable = false;
      debugPrint('Secure storage write unavailable — Hive only.');
    } catch (e) {
      _secureAvailable = false;
      debugPrint('Secure storage write failed — Hive only. ($e)');
    }
  }

  Future<void> _deleteToken() async {
    if (!_secureAvailable) return;
    try {
      await _secure.delete(key: _kToken);
    } on MissingPluginException {
      _secureAvailable = false;
    } catch (e) {
      debugPrint('Secure storage delete failed: $e');
    }
  }
}
