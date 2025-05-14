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

    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.onboardingFlow:
        return MaterialPageRoute(builder: (_) => const OnboardingPageFlow());

      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignupPage());

      case RouteNames.logIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteNames.createPin:
        return MaterialPageRoute(
          builder:
              (_) => ChoosePinScreen(
                onPinConfirmed: (pin) {
                  debugPrint('PIN confirmed: $pin');
                },
              ),
        );

      case RouteNames.homePage:
        final email = args as String;
        return MaterialPageRoute(builder: (_) => HomePage(email: email));

      case RouteNames.forgotPassword:
        return MaterialPageRoute(
          builder:
              (_) => PasswordResetScreen(
                onSendResetCode: (email) {
                  debugPrint('Sending reset code to: $email');
                },
              ),
        );
    }
  }
}
