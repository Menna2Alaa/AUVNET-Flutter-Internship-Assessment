import 'package:e_commerce_app/widgets/custome_button.dart';
import 'package:e_commerce_app/widgets/custome_onboarding_logo.dart';
import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class CustomeOnBoardingView extends StatelessWidget {
  const CustomeOnBoardingView({
    super.key,
    required this.next,
    required this.getStarted,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;
  final VoidCallback next;
  final VoidCallback getStarted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: CustomeOnboardingLogo()),
            CustomeText(text: title, fontSize: 18, font: FontWeight.bold),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomeText(text: subtitle, textColor: Color(0xff677294)),
            ),
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  getStarted();
                },
                child: CustomeButton(text: 'Get started'),
              ),
            ),
            SizedBox(height: 14),
            GestureDetector(
              onTap: () {
                next();
              },
              child: CustomeText(text: 'next', textColor: Color(0xff677294)),
            ),
          ],
        ),
      ),
    );
  }
}
