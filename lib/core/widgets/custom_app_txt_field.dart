import 'package:flutter/material.dart';

class CustomAppTxtField extends StatelessWidget {
  const CustomAppTxtField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
