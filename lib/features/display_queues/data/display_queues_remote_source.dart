import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/services/api_client.dart';
import '../../../models/display_queue.dart';

/// Public remote source for hospital display boards (no auth).
class DisplayQueuesRemoteSource {
  DisplayQueuesRemoteSource({Dio? dio}) : _dioOverride = dio;

  final Dio? _dioOverride;

  Dio get _dio => _dioOverride ?? ApiClient.instance.dio;

  /// `GET /display/queues` — public, snake_case payload.
  Future<DisplayQueuesResponse> fetchQueues() async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/display/queues',
      options: Options(extra: const {'skipAuth': true}),
    );
    final data = response.data;
    if (data == null) {
      return const DisplayQueuesResponse();
    }
    final parsed = DisplayQueuesResponse.fromJson(data);
    debugPrint(
      'GET /display/queues OK — ${parsed.departments.length} department(s)',
    );
    return parsed;
  }
}
