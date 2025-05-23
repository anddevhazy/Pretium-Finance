import 'package:flutter/material.dart';
import 'package:pretium/features/app/const_colours/colors.dart';
import 'package:pretium/features/app/onboarding/onboarding_flow_items.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingFlowItem item;
  final int index;
  const OnboardingPage({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: secondaryColour,
            shape: BoxShape.circle,
          ),
          child: Center(
            child:
                index == 0
                    ? Hero(
                      tag: 'logoHero',
                      createRectTween: (begin, end) {
                        return MaterialRectArcTween(begin: begin, end: end);
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/pretium.png',
                          width: 110,
                          height: 110,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                    : Icon(item.icon, size: 50.0, color: primaryColour),
          ),
        ),
        const SizedBox(height: 32.0),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: blackColour,
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            item.description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, color: greyColour, height: 1.5),
          ),
        ),
      ],
    );
  }
}
