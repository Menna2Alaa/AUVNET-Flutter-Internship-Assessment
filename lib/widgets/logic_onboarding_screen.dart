// // ignore_for_file: use_build_context_synchronously

// import 'package:e_commerce_app/views/first_onboarding_view.dart';
// import 'package:e_commerce_app/views/login_view.dart';
// import 'package:e_commerce_app/views/second_onboarding_view.dart';
// import 'package:e_commerce_app/views/third_onboarding_view.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LogicOnboardingScreen extends StatefulWidget {
//   const LogicOnboardingScreen({super.key});

//   @override
//   State<LogicOnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<LogicOnboardingScreen> {
//   final PageController _controller = PageController();
//   int currentPage = 0;

//   void _nextPage() {
//     if (currentPage < 2) {
//       _controller.nextPage(
//         duration: Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//       );
//     }
//   }

//   void _goToLogin() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isFirstTime', false);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => LoginView()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _controller,
//         onPageChanged: (index) => setState(() => currentPage = index),
//         children: [
//           FirstOnboardingView(next: _nextPage, getStarted: _goToLogin),
//           SecondOnboardingView(next: _nextPage, getStarted: _goToLogin),
//           ThirdOnboardingView(next: _nextPage, getStarted: _goToLogin),
//         ],
//       ),
//     );
//   }
// }
