import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/router/app_router.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';

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
    // Notification taps (FCM or local) deep-link through the router.
    NotificationService.instance.onDeepLink = (route) {
      _router.push(route);
    };
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
      // Force RTL across the whole app and clamp extreme text scaling so
      // layouts always reflow without overflow while still respecting the
      // user's accessibility preference.
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
