import 'package:flutter/material.dart';

class OnboardingFlowItem {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;

  OnboardingFlowItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
  });
}
