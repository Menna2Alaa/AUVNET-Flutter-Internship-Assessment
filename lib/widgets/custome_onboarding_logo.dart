import 'package:flutter/material.dart';

class CustomeOnboardingLogo extends StatelessWidget {
  const CustomeOnboardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -50,
          child: Image.asset(
            'assets/images/Ellipse 153.png',
            width: 300,
            height: 410,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          width: 336,
          height: 336,
          top: 80,
          right: 0,
          child: Image.asset('assets/images/nawel.png', fit: BoxFit.cover),
        ),
      ],
    );
  }
}
