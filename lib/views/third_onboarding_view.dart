import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/widgets/custome_on_boarding_view.dart';
import 'package:flutter/material.dart';

class ThirdOnboardingView extends StatelessWidget {
  const ThirdOnboardingView({super.key});
  static String id = kThirdOnboardingId;

  @override
  Widget build(BuildContext context) {
    return CustomeOnBoardingView(
      next: () {
        Navigator.pushNamed(context, LoginView.id);
      },
      getStarted: () {
        Navigator.pushNamed(context, LoginView.id);
      },
      title: 'Sales & Discounts',
      subtitle: 'Discover exclusive sales and deals every day',
    );
  }
}
