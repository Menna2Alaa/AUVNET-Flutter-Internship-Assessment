import 'package:e_commerce_app/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class CustomeQrCode extends StatelessWidget {
  const CustomeQrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Icon(Icons.qr_code, color: Color(0xff8900FE), size: 30),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomeText(
                  text: "Get a code!",
                  textColor: Colors.black,
                  font: FontWeight.bold,
                  fontSize: 16,
                ),
                SizedBox(height: 4),
                CustomeText(
                  text: "add your code and save in your order!",
                  textColor: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.grey.shade500, size: 16),
        ],
      ),
    );
  }
}
