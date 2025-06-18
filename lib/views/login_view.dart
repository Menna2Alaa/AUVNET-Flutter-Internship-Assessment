// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/show_snak_bar.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:e_commerce_app/views/sign_up_view.dart';
import 'package:e_commerce_app/widgets/custome_button.dart';
import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/widgets/custome_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(kLogo, height: 300),
                SizedBox(height: 60),
                CustomeTextFormField(
                  icon: Icons.email,
                  onChanged: (data) {
                    email = data;
                  },
                  text: 'Email',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomeTextFormField(
                  icon: Icons.lock,
                  isSecure: true,
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 32),
                CustomeButton(
                  text: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoding = true;
                      setState(() {});
                      Navigator.pushNamed(
                        context,
                        HomeView.id,
                        arguments: email,
                      );
                      try {
                        await signIn();
                        showSnakBar(context, 'success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnakBar(context, 'user not found');
                        } else if (e.code == 'wrong-password') {
                          showSnakBar(context, 'incorrect password');
                        }
                      } catch (e) {
                        showSnakBar(context, 'There is an error');
                      }
                      isLoding = false;
                      setState(() {});
                    }
                  },
                ),
                SizedBox(height: 10),

                GestureDetector(
                  child: CustomeText(
                    text: 'Create an account',
                    textColor: Color(0xff1877F2),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SignUpView.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
