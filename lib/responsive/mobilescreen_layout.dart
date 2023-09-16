import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';

import '../views/auth/login.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: Text("Mobile Scrren"),
      ),
    );
  }
}
