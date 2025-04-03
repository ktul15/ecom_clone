import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.validator,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(color: Pallete.textColor, fontSize: 14),
      cursorColor: Pallete.textColor,
      selectionControls: MaterialTextSelectionControls(),
      validator: validator,
    );
  }
}
