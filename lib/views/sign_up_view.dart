// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/helper/show_snak_bar.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:e_commerce_app/widgets/custome_button.dart';
import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/widgets/custome_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static String id = kSignUpId;

  @override
  State<SignUpView> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpView> {
  String? email;

  String? password;

  String? confirmPassword;

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
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomeTextFormField(
                  isSecure: true,
                  icon: Icons.lock,
                  onChanged: (data) {
                    password = data;
                  },
                  text: 'Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomeTextFormField(
                  isSecure: true,
                  icon: Icons.lock,
                  onChanged: (data) {
                    confirmPassword = data;
                  },
                  text: 'Confirm Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomeButton(
                  text: 'Sign Up',
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
                        await registerUser();
                        showSnakBar(context, 'success');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakBar(context, 'weak password');
                        } else if (e.code == 'email-already-in-use') {
                          showSnakBar(context, 'email already exists');
                          Navigator.pop(context);
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
                    text: 'Already have an account?',
                    textColor: Color(0xff1877F2),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
