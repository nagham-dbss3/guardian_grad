import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/auth_providers.dart';
import 'features/shared/data/guardian_providers.dart';

class BasmaApp extends ConsumerStatefulWidget {
  const BasmaApp({super.key});

  @override
  ConsumerState<BasmaApp> createState() => _BasmaAppState();
}

class _BasmaAppState extends ConsumerState<BasmaApp> {
  late final GoRouter _router = createRouter();

  @override
  void initState() {
    super.initState();
    _wirePushCallbacks();

    // Notification taps (FCM or local) deep-link through the router.
    NotificationService.instance.onDeepLink = (route) {
      _router.push(route);
    };

    // Validate token via /auth/me after the first frame (non-blocking startup).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _validateSessionInBackground();
    });
  }

  void _wirePushCallbacks() {
    final push = NotificationService.instance;
    push.registerDeviceToken = (fcmToken, platform) {
      return ref.read(guardianRepositoryProvider).registerDeviceToken(
            fcmToken: fcmToken,
            platform: platform,
          );
    };
    push.unregisterDeviceToken = (fcmToken) {
      return ref
          .read(guardianRepositoryProvider)
          .unregisterDeviceToken(fcmToken: fcmToken);
    };
    push.onInboxRefresh = () {
      return ref.read(guardianControllerProvider.notifier).syncNotifications();
    };
  }

  Future<void> _validateSessionInBackground() async {
    try {
      final user =
          await ref.read(authRepositoryProvider).restoreSession();
      if (user != null) {
        debugPrint(
          'Session validated for ${user.fullName} (#${user.id})',
        );
      }
      // Refresh guardian profile + children + FCM token when a session is present.
      if (ref.read(authServiceProvider).isLoggedIn) {
        await ref
            .read(guardianControllerProvider.notifier)
            .syncProfile(clearFirst: false);
      }
    } catch (e) {
      debugPrint('Background session validation skipped: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'رعاية بسمة',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _router,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(
            textScaler: mq.textScaler.clamp(
              minScaleFactor: 0.9,
              maxScaleFactor: 1.4,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          ),
        );
      },
    );
  }
}
