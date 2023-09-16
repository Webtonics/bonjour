import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/views/auth/login.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Success"),
        actions: [
          IconButton(
              onPressed: () {
                AuthMethods().logOutUser();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("Successful"),
      ),
    );
  }
}
