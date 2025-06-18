import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField({
    super.key,
    required this.icon,
    this.text,
    this.onChanged,
    this.isSecure = false,
    this.validator,
  });
  final IconData icon;
  String? text;
  bool? isSecure;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure!,
      validator: validator,

      // validator: (data) {
      //   if (data!.isEmpty) {
      //     return 'field is required';
      //
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Color(0xffC4C4C4)),
        hintText: text,
        hintStyle: TextStyle(color: Color(0xffC4C4C4)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffC4C4C4)),
        ),
      ),
    );
  }
}
