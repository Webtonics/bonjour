import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.keyboardtype,
      required this.hint,
      required this.obscure,
      this.icon,
      this.iconAction});

  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType keyboardtype;
  final IconData? icon;
  final VoidCallback? iconAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: FocusNode(),
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: iconAction, icon: Icon(icon)),
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        // fillColor: ,
        hintText: hint,
        label: Text(label),
        labelStyle: const TextStyle(),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
      keyboardType: keyboardtype,
    );
  }
}
