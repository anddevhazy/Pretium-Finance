import 'package:flutter/material.dart';
import 'package:pretium/features/app/const_colours/colors.dart';
import 'package:pretium/features/app/onboarding/onboarding_flow_items.dart';
import 'package:pretium/features/app/onboarding/onboarding_page.dart';
import 'package:pretium/features/routes/route_names.dart';

class OnboardingPageFlow extends StatefulWidget {
  const OnboardingPageFlow({super.key});

  @override
  State<OnboardingPageFlow> createState() => _OnboardingPageFlowState();
}

class _OnboardingPageFlowState extends State<OnboardingPageFlow> {
  final PageController pageRemote = PageController();
  int _currentPage = 0;

  final List<OnboardingFlowItem> onboardingFlowItems = [
    OnboardingFlowItem(
      icon: Icons.credit_card,
      title: 'Direct Pay',
      description: 'Pay with Crypto across Africa effortlessly',
      buttonText: "Next",
    ),
    OnboardingFlowItem(
      icon: Icons.account_balance_wallet_rounded,
      title: 'Accept Payments',
      description: 'Accept stablecoin payments hassle-free',
      buttonText: "Next",
    ),

    OnboardingFlowItem(
      icon: Icons.receipt_long_rounded,
      title: 'Pay Bills',
      description: 'Pay for Utility services and earn rewards',
      buttonText: "Get Started",
    ),
  ];

  @override
  void dispose() {
    pageRemote.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RouteNames.signUp);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageRemote,
                itemCount: onboardingFlowItems.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    item: onboardingFlowItems[index],
                    index: index,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 32.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingFlowItems.length,
                      (index) => buildPageIndicator(index),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < onboardingFlowItems.length - 1) {
                        pageRemote.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.signUp,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColour,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      onboardingFlowItems[_currentPage].buttonText,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Color(0xFF0F5652) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
