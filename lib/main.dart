import 'package:e_commerce_app/Blocs/home_bloc.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/helper/hive_services.dart';
import 'package:e_commerce_app/views/first_onboarding_view.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:e_commerce_app/views/login_view.dart';
import 'package:e_commerce_app/views/second_onboarding_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/views/splash_view.dart';
import 'package:e_commerce_app/views/third_onboarding_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('settings');
  await Hive.initFlutter();
  await HiveService.initHive();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ECommerceApp(hiveRepository: HiveService()));
}

class ECommerceApp extends StatelessWidget {
  final HiveService hiveRepository;

  const ECommerceApp({super.key, required this.hiveRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(hiveRepository),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginView.id: (context) => const LoginView(),
          SignUpView.id: (context) => const SignUpView(),
          HomeView.id: (context) => const HomeView(),
          FirstOnboardingView.id: (context) => const FirstOnboardingView(),
          SecondOnboardingView.id: (context) => const SecondOnboardingView(),
          ThirdOnboardingView.id: (context) => const ThirdOnboardingView(),
          SplashView.id: (context) => const SplashView(),
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
