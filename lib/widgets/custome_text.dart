import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeText extends StatelessWidget {
  CustomeText({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.font,
    this.fontSize,
    this.onTap,
  });

  void Function()? onTap;
  final String text;
  Color textColor;
  FontWeight? font;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? 14,
          fontWeight: font ?? FontWeight.normal,
        ),
      ),
    );
  }
}
