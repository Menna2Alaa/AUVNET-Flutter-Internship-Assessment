import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/third_onboarding_view.dart';
import 'package:e_commerce_app/widgets/custome_on_boarding_view.dart';
import 'package:flutter/material.dart';

class SecondOnboardingView extends StatelessWidget {
  const SecondOnboardingView({super.key});
  static String id = kSecondOnboardingId;

  @override
  Widget build(BuildContext context) {
    return CustomeOnBoardingView(
      next: () {
        Navigator.pushNamed(context, ThirdOnboardingView.id);
      },
      getStarted: () {
        Navigator.pushNamed(context, LoginView.id);
      },
      title: 'User_to_User Delivery',
      subtitle: 'Send or receive items from other users quickly and easily',
    );
  }
}
