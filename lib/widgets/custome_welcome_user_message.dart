// custome_welcome_user_message.dart
import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:flutter/material.dart';

class CustomeWelcomeUserMessage extends StatelessWidget {
  final UserModel? user;

  const CustomeWelcomeUserMessage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeText(
                  font: FontWeight.bold,
                  fontSize: 18,
                  text: "Delivering to",
                ),
                CustomeText(
                  text: user?.address ?? 'Al Satwa, 81A Street',
                  font: FontWeight.bold,
                  fontSize: 18,
                ),
                SizedBox(height: 10),
                CustomeText(
                  font: FontWeight.bold,
                  fontSize: 18,
                  text: 'Hi ${user?.name ?? 'Heba'}',
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/image.png',

            width: 60,
            height: 60,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.person, color: Colors.white, size: 30),
              );
            },
          ),
        ],
      ),
    );
  }
}
