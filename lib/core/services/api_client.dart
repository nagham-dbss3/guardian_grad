import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/api_config.dart';
import 'session_storage.dart';

/// Shared Dio HTTP client with automatic Bearer token injection.
class ApiClient {
  ApiClient._();
  static final ApiClient instance = ApiClient._();

  Dio? _dio;
  bool _ready = false;

  /// Lazily initializes if [init] was not called yet (safe for hot restart).
  Dio get dio {
    if (!_ready) init();
    return _dio!;
  }

  void init({SessionStorage? session}) {
    if (_ready) return;
    final storage = session ?? SessionStorage.instance;

    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.connectTimeout,
        receiveTimeout: ApiConfig.receiveTimeout,
        headers: Map<String, dynamic>.from(ApiConfig.defaultHeaders),
        responseType: ResponseType.json,
      ),
    );

    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Public endpoints (e.g. GET /display/queues) set extra.skipAuth.
          final skipAuth = options.extra['skipAuth'] == true;
          if (skipAuth) {
            options.headers.remove('Authorization');
          } else {
            final token = storage.token;
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          debugPrint(
            'API error [${error.response?.statusCode}] '
            '${error.requestOptions.method} ${error.requestOptions.path}: '
            '${error.message}',
          );
          return handler.next(error);
        },
      ),
    );

    _ready = true;
  }
}
