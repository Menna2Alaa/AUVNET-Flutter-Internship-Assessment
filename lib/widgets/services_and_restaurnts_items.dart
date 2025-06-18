import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class ServicesndResturntsItems extends StatelessWidget {
  const ServicesndResturntsItems({
    super.key,
    required this.image,
    required this.text,
  });
  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 100,
          height: 100,

          child: Image.asset(image),
        ),
        SizedBox(height: 5),
        CustomeText(text: text, font: FontWeight.bold),
      ],
    );
  }
}
