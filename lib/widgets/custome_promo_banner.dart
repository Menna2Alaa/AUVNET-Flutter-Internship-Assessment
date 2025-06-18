import 'package:flutter/material.dart';

class CustomePromoBanner extends StatelessWidget {
  const CustomePromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/photo_2023-09-03_13-36-55 1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
