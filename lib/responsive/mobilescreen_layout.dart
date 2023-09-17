import 'package:bonjour/models/user.dart' as model;
import 'package:bonjour/providers/user_provider.dart';
import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile"),
      ),
      backgroundColor: mobileBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Text(user.email),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Mobile"),
    //     actions: [
    //       IconButton(
    //           onPressed: () {
    //             AuthMethods().logOutUser();
    //           },
    //           icon: const Icon(Icons.abc))
    //     ],
    //   ),
    //   body: const Center(
    //     child: Text("Hello"),
    //   ),
    // );
  }
}
