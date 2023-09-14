import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //logo
            Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: const Image(
                    image: AssetImage("assets/images/bonjour_full.png"))),

            //username field
            const TextField()
            // password field

            // button
          ],
        ),
      )),
    );
  }
}
