import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app.dart';
import 'core/services/local_cache.dart';
import 'core/services/notification_service.dart';
import 'features/shared/data/guardian_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Arabic locale for intl formatting.
  Intl.defaultLocale = 'ar';
  await initializeDateFormatting('ar');

  // Offline cache + seed mock data on first launch.
  await LocalCache.instance.init();
  final repo = GuardianRepository(LocalCache.instance);
  await repo.ensureSeeded();

  // Guarded Firebase init — the app must run fine without Firebase config.
  await _initFirebaseGuarded();

  // Notifications (local + FCM façade). Safe if Firebase is absent.
  await NotificationService.instance.init();

  // Schedule dose reminders from the latest discharge report, honoring prefs.
  final prefs = repo.prefs();
  await NotificationService.instance.rescheduleDoseReminders(
    repo.activeRecord(),
    enabled: prefs.doseReminders,
  );

  runApp(const ProviderScope(child: BasmaApp()));
}

Future<void> _initFirebaseGuarded() async {
  try {
    // Only initializes if platform config (google-services.json /
    // GoogleService-Info.plist) is present. Otherwise this throws and we
    // continue in mock mode with push disabled.
    await Firebase.initializeApp();
    debugPrint('Firebase initialized.');
  } catch (e) {
    debugPrint('Firebase not configured — running in mock mode. ($e)');
  }
}
