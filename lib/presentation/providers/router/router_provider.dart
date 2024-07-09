import 'package:go_router/go_router.dart';
import 'package:groceries_app/presentation/pages/main_page/main_page.dart';
import 'package:groceries_app/presentation/pages/onboarding_page/onboarding_page.dart';
import 'package:groceries_app/presentation/pages/register_page/register_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:groceries_app/presentation/pages/login_page/login_page.dart';
import 'package:groceries_app/presentation/pages/splash_page/splash_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          builder: (context, state) => const OnboardingPage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegisterPage(),
        ),
        GoRoute(
          path: '/',
          name: 'main',
          builder: (context, state) => const MainPage(),
        ),
      ],
      initialLocation: '/splash',
      debugLogDiagnostics: false,
    );
