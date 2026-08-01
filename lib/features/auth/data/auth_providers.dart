import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/api_client.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/local_cache.dart';
import '../../../core/services/session_storage.dart';
import 'auth_repository.dart';

final sessionStorageProvider = Provider<SessionStorage>(
  (ref) => SessionStorage.instance,
);

final apiClientProvider = Provider<ApiClient>((ref) {
  final client = ApiClient.instance;
  // Ensure interceptors are wired (idempotent).
  client.init(session: ref.watch(sessionStorageProvider));
  return client;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  ref.watch(apiClientProvider);
  return AuthRepository(
    session: ref.watch(sessionStorageProvider),
  );
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    ref.watch(authRepositoryProvider),
    cache: LocalCache.instance,
  );
});
