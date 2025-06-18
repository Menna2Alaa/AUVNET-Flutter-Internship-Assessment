import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/second_onboarding_view.dart';
import 'package:e_commerce_app/widgets/custome_on_boarding_view.dart';

import 'package:flutter/material.dart';

class FirstOnboardingView extends StatelessWidget {
  const FirstOnboardingView({super.key});
  static String id = 'FirstOnboardingView';

  @override
  Widget build(BuildContext context) {
    return CustomeOnBoardingView(
      next: () {
        Navigator.pushNamed(context, SecondOnboardingView.id);
      },
      getStarted: () {
        Navigator.pushNamed(context, LoginView.id);
      },
      title: 'all_in_one Delivery',
      subtitle:
          'Order groceries, medicines, and meals delivered straight to your door',
    );
  }
}
