import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/appointments/presentation/appointments_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/checkin_qr/presentation/qr_screen.dart';
import '../../features/child_record/presentation/record_screen.dart';
import '../../features/discharge_reports/presentation/discharge_detail_screen.dart';
import '../../features/discharge_reports/presentation/discharge_screen.dart';
import '../../features/display_queues/presentation/queues_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/lab_results/presentation/result_detail_screen.dart';
import '../../features/lab_results/presentation/results_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/treatment_journey/presentation/journey_screen.dart';
import '../services/local_cache.dart';
import 'app_shell.dart';

final _rootKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

/// Builds the app router. The same instance is used to handle notification
/// deep links (see NotificationService.onDeepLink wiring in app.dart).
GoRouter createRouter() {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: '/',
    redirect: (context, state) {
      final loggedIn = LocalCache.instance.isLoggedIn;
      final goingToLogin = state.matchedLocation == '/login';
      if (!loggedIn) return goingToLogin ? null : '/login';
      if (goingToLogin) return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellKey,
            routes: [
              GoRoute(path: '/', builder: (c, s) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/record', builder: (c, s) => const RecordScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/results', builder: (c, s) => const ResultsScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/appointments',
                  builder: (c, s) => const AppointmentsScreen()),
            ],
          ),
        ],
      ),
      // Detail / pushed routes (root navigator — full screen).
      GoRoute(
        path: '/qr',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const QrScreen(),
      ),
      GoRoute(
        path: '/queues',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const QueuesScreen(),
      ),
      GoRoute(
        path: '/journey',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const JourneyScreen(),
      ),
      GoRoute(
        path: '/results/:id',
        parentNavigatorKey: _rootKey,
        builder: (context, state) =>
            ResultDetailScreen(resultId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/discharge',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const DischargeScreen(),
      ),
      GoRoute(
        path: '/discharge/:id',
        parentNavigatorKey: _rootKey,
        builder: (context, state) =>
            DischargeDetailScreen(reportId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/notifications',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/profile',
        parentNavigatorKey: _rootKey,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
