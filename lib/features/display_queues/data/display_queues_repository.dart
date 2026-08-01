import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/display_queue.dart';
import 'display_queues_remote_source.dart';

/// Fetches public waiting queues; keeps last successful snapshot for offline UI.
class DisplayQueuesRepository {
  DisplayQueuesRepository({DisplayQueuesRemoteSource? remote})
      : _remote = remote ?? DisplayQueuesRemoteSource();

  final DisplayQueuesRemoteSource _remote;
  DisplayQueuesResponse _cache = const DisplayQueuesResponse();

  DisplayQueuesResponse get cached => _cache;

  Future<DisplayQueuesResponse> fetchQueues() async {
    try {
      final fresh = await _remote.fetchQueues();
      _cache = fresh;
      return fresh;
    } on DioException catch (e) {
      debugPrint('display queues offline/error: $e');
      return _cache;
    } catch (e) {
      debugPrint('display queues parse error: $e');
      return _cache;
    }
  }
}
