import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grox/core/router/app_routes.dart';
import 'package:grox/features/auth/presentation/pages/auth_page.dart';
import 'package:grox/features/auth/presentation/pages/complete_setup_page.dart';
import 'package:grox/features/auth/presentation/pages/create_account_page.dart';
import 'package:grox/features/auth/presentation/pages/introduction_page.dart';
import 'package:grox/features/auth/presentation/pages/verify_email_page.dart';
import 'package:grox/features/auth/presentation/pages/verify_phone_number.dart';
import 'package:grox/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:grox/features/welcome/presentation/pages/onboarding_page.dart';
import 'package:grox/features/welcome/presentation/pages/splash_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.createAccount,
        builder: (context, state) => const CreateAccountPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: AppRoutes.verifyEmail,
        builder: (context, state) => const VerifyEmailPage(),
      ),
      GoRoute(
        path: AppRoutes.verifyPhone,
        builder: (context, state) => const VerifyPhoneNumberPage(),
      ),
      GoRoute(
        path: AppRoutes.introduction,
        builder: (context, state) => const IntroductionPage(),
      ),
      GoRoute(
        path: AppRoutes.completeSetup,
        builder: (context, state) => const CompleteSetupPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );

  return router;
});