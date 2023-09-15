import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, required this.action});

  final String title;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          minimumSize: const Size(double.infinity, 60),
          maximumSize: const Size(double.infinity, 70)),
      child: Text(title),
    );
  }
}
