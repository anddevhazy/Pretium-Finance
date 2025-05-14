import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pretium/features/app/const_colours/colors.dart';
import 'package:pretium/features/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.onboardingFlow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColour,
      body: Center(child: Image.asset('assets/opay.png')),
    );
  }
}
