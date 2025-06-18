import 'dart:async';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/views/first_onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = kSplashViewId;

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), checkFirstLaunch);
  }

  void checkFirstLaunch() async {
    final box = Hive.box('settings');
    final isFirstTime =
        box.get('onboardingComplete', defaultValue: false) == false;

    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => FirstOnboardingView()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Timer(
    //   Duration(seconds: 3),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => LoginView()),
    //   ),
    // );

    return Container(color: Colors.white, child: Image.asset(kLogo));
  }
}
