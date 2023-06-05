import 'package:flutter/material.dart';

class CustomTextFielWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;
  const CustomTextFielWidget(
      {super.key,
      required this.onChanged,
      required this.label,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(label)),
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      obscureText: obscureText,
    );
  }
}
