import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../core/core.dart';
import '../features/pages.dart';
import '../models/models.dart';

class AppRoutes {
  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final _baseNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    observers: [TalkerRouteObserver(sl<LoggerService>().talker)],
    initialLocation: InstallationWizardPage.route,
    routes: [
      ShellRoute(
        navigatorKey: _baseNavigatorKey,
        observers: [TalkerRouteObserver(sl<LoggerService>().talker)],
        builder: (context, state, child) => BasePage(child: child),
        routes: [
          GoRoute(
            path: InstallationWizardPage.route,
            builder: (context, state) => const InstallationWizardPage(),
          ),
          GoRoute(
            path: LoginPage.route,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: WelcomeBackPage.route,
            builder: (context, state) {
              final userDevice = state.extra as UserDevice?;
             
              return WelcomeBackPage(userDevice: userDevice);
            },
          ),
          GoRoute(
            path: HomePage.route,
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
}
