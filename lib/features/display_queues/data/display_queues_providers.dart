import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/display_queue.dart';
import 'display_queues_repository.dart';

final displayQueuesRepositoryProvider = Provider<DisplayQueuesRepository>(
  (ref) => DisplayQueuesRepository(),
);

/// Live public waiting boards (`GET /display/queues`).
final displayQueuesProvider =
    AsyncNotifierProvider<DisplayQueuesNotifier, DisplayQueuesResponse>(
  DisplayQueuesNotifier.new,
);

class DisplayQueuesNotifier extends AsyncNotifier<DisplayQueuesResponse> {
  @override
  Future<DisplayQueuesResponse> build() =>
      ref.read(displayQueuesRepositoryProvider).fetchQueues();

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () => ref.read(displayQueuesRepositoryProvider).fetchQueues(),
    );
  }
}
