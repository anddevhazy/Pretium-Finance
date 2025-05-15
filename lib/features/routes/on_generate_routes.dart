import 'package:flutter/material.dart';
import 'package:pretium/features/app/onboarding/onboarding_flow.dart';
import 'package:pretium/features/app/splash/splash_screen.dart';
import 'package:pretium/features/auth/presentation/pages/choose_pin_screen.dart';
import 'package:pretium/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:pretium/features/auth/presentation/pages/login_page.dart';
import 'package:pretium/features/auth/presentation/pages/signup_page.dart';
import 'package:pretium/features/home/presentation/pages/home_page.dart';
import 'package:pretium/features/routes/route_names.dart';

class OnGenerateRoutes {
  static Route<dynamic>? generate(RouteSettings settings) {
    final args = settings.arguments;

    Route<dynamic> _fadeRoute(Widget page, {required Duration duration}) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: duration,
      );
    }

    switch (settings.name) {
      case RouteNames.splashScreen:
        return _fadeRoute(
          const SplashScreen(),
          duration: const Duration(milliseconds: 300),
        );

      case RouteNames.onboardingFlow:
        return _fadeRoute(
          const OnboardingPageFlow(),
          duration: const Duration(milliseconds: 3000),
        );

      case RouteNames.signUp:
        return _fadeRoute(
          const SignupPage(),
          duration: const Duration(milliseconds: 300),
        );

      case RouteNames.logIn:
        return _fadeRoute(
          const LoginScreen(),
          duration: const Duration(milliseconds: 300),
        );

      case RouteNames.createPin:
        return _fadeRoute(
          ChoosePinScreen(
            onPinConfirmed: (pin) {
              debugPrint('PIN confirmed: $pin');
            },
          ),
          duration: const Duration(milliseconds: 300),
        );

      case RouteNames.homePage:
        final email = args as String;
        return _fadeRoute(
          HomePage(email: email),
          duration: const Duration(milliseconds: 300),
        );

      case RouteNames.forgotPassword:
        return _fadeRoute(
          PasswordResetScreen(
            onSendResetCode: (email) {
              debugPrint('Sending reset code to: $email');
            },
          ),
          duration: const Duration(milliseconds: 300),
        );
    }
  }
}
