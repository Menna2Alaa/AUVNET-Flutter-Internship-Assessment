// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class ShortcutsItems extends StatelessWidget {
  ShortcutsItems({
    super.key,
    required this.icon,
    required this.text,
    this.fontWeight = FontWeight.bold,
  });
  final String text;
  final IconData icon;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFEEE6),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 65,
          height: 65,

          child: Icon(icon, color: Color(0xff8900FE)),
        ),
        SizedBox(height: 5),
        CustomeText(text: text, font: fontWeight),
      ],
    );
  }
}
