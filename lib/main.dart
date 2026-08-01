import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app.dart';
import 'core/services/api_client.dart';
import 'core/services/fcm_service.dart';
import 'core/services/local_cache.dart';
import 'core/services/notification_service.dart';
import 'core/services/session_storage.dart';
import 'features/shared/data/guardian_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = 'ar';
  await initializeDateFormatting('ar');

  await LocalCache.instance.init();

  // Session + HTTP client BEFORE any repository that may touch the network.
  try {
    await SessionStorage.instance.init();
  } catch (e) {
    debugPrint('SessionStorage.init failed (continuing): $e');
  }
  ApiClient.instance.init(session: SessionStorage.instance);

  final repo = GuardianRepository(LocalCache.instance);
  await repo.ensureSeeded();

  if (SessionStorage.instance.hasToken) {
    debugPrint('Bootstrap: local auth token present');
  } else {
    debugPrint('Bootstrap: no persisted auth session');
  }

  await _initFirebaseGuarded();
  // Must be registered before runApp (and only when Firebase is ready).
  if (Firebase.apps.isNotEmpty) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  await NotificationService.instance.init();

  final prefs = repo.prefs();
  await NotificationService.instance.rescheduleDoseReminders(
    repo.activeRecord(),
    enabled: prefs.doseReminders,
  );

  runApp(const ProviderScope(child: BasmaApp()));
}

Future<void> _initFirebaseGuarded() async {
  try {
    await Firebase.initializeApp();
    debugPrint('Firebase initialized.');
  } catch (e) {
    debugPrint('Firebase not configured — push disabled. ($e)');
  }
}
