import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/api_client.dart';
import '../../../core/services/local_cache.dart';
import '../../../core/services/session_storage.dart';
import '../../../models/user.dart';

/// Domain-level auth failure with an Arabic [message] for the UI.
class AuthFailure implements Exception {
  const AuthFailure(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Talks to `/auth/*` endpoints and persists the session.
class AuthRepository {
  AuthRepository({
    Dio? dio,
    SessionStorage? session,
  })  : _dio = dio ?? ApiClient.instance.dio,
        _session = session ?? SessionStorage.instance;

  final Dio _dio;
  final SessionStorage _session;

  UserModel? get currentUser => _session.currentUser;
  String? get token => _session.token;
  bool get hasToken => _session.hasToken;

  /// `POST /auth/login` — stores token + user on success.
  Future<AuthResultModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth/login',
        data: {
          'email': email.trim(),
          'password': password,
        },
      );

      final data = response.data;
      if (data == null) {
        throw const AuthFailure('استجابة غير متوقعة من الخادم.');
      }

      final result = AuthResultModel.fromJson(data);
      await _session.saveSession(token: result.token, user: result.user);
      debugPrint(
        'Auth login OK — user=#${result.user.id} ${result.user.fullName}',
      );
      return result;
    } on DioException catch (e) {
      throw AuthFailure(_mapDioError(e));
    }
  }

  /// `POST /auth/logout` — best-effort remote revoke, always clears local session.
  Future<void> logout() async {
    try {
      if (_session.hasToken) {
        await _dio.post<void>('/auth/logout');
        debugPrint('Auth logout OK — remote session revoked');
      }
    } on DioException catch (e) {
      debugPrint('Logout API failed (continuing local clear): $e');
    } finally {
      await _session.clear();
    }
  }

  /// Restores a previous session via stored token + optional `GET /auth/me`.
  ///
  /// - No token → clears flags, returns `null`
  /// - `/auth/me` succeeds → refreshes user, returns user
  /// - `/auth/me` 401/403 → clears session, returns `null`
  /// - Network / other errors → keeps local token + user (offline resume)
  Future<UserModel?> restoreSession() async {
    if (!_session.hasToken) {
      await _session.clear();
      return null;
    }

    try {
      final user = await _fetchMeRaw();
      await _session.saveSession(token: _session.token!, user: user);
      debugPrint('Session restored via /auth/me — user=#${user.id}');
      return user;
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      if (code == 401 || code == 403) {
        debugPrint('Session invalid ($code) — clearing');
        await _session.clear();
        return null;
      }

      // Offline, 404 (endpoint missing), 5xx, etc. → local persistence wins.
      final local = _session.currentUser;
      await LocalCache.instance.setLoggedIn(true);
      debugPrint(
        'Session kept locally (auth/me unavailable: $code / ${e.type})',
      );
      return local;
    }
  }

  /// `GET /auth/me` — validates the stored bearer token.
  Future<UserModel> fetchMe() async {
    try {
      return await _fetchMeRaw();
    } on DioException catch (e) {
      throw AuthFailure(_mapDioError(e, forSessionCheck: true));
    }
  }

  Future<UserModel> _fetchMeRaw() async {
    final response = await _dio.get<dynamic>('/auth/me');
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data['user'] is Map<String, dynamic>) {
        return UserModel.fromJson(data['user'] as Map<String, dynamic>);
      }
      return UserModel.fromJson(data);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Unexpected /auth/me payload',
    );
  }

  String _mapDioError(DioException e, {bool forSessionCheck = false}) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return 'انتهت مهلة الاتصال. حاولوا مرة أخرى.';
      case DioExceptionType.connectionError:
        return 'تعذّر الاتصال بالخادم. تحققوا من الإنترنت.';
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401 || code == 403) {
          return forSessionCheck
              ? 'الجلسة غير صالحة.'
              : 'بيانات الدخول غير صحيحة.';
        }
        if (code == 404 && forSessionCheck) {
          return 'تعذّر التحقق من الجلسة.';
        }
        if (code == 422) {
          return _extractValidationMessage(e.response?.data) ??
              'بيانات الدخول غير صحيحة.';
        }
        if (code == 429) {
          return 'محاولات كثيرة. حاولوا لاحقًا.';
        }
        if (code != null && code >= 500) {
          return 'خطأ في الخادم. حاولوا لاحقًا.';
        }
        return _extractValidationMessage(e.response?.data) ??
            'فشل تسجيل الدخول. حاولوا مرة أخرى.';
      case DioExceptionType.cancel:
        return 'تم إلغاء الطلب.';
      case DioExceptionType.badCertificate:
        return 'تعذّر التحقق من شهادة الخادم.';
      case DioExceptionType.unknown:
        return 'حدث خطأ غير متوقع. حاولوا مرة أخرى.';
    }
  }

  String? _extractValidationMessage(dynamic data) {
    if (data is Map) {
      final message = data['message'];
      if (message is String && message.trim().isNotEmpty) return message;
      final errors = data['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final first = errors.values.first;
        if (first is List && first.isNotEmpty) return first.first.toString();
        if (first is String) return first;
      }
    }
    return null;
  }
}
