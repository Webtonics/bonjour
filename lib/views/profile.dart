import 'package:bonjour/models/user.dart';
import 'package:bonjour/providers/user_provider.dart';
import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _usernameController = TextEditingController();
  @override
  void initState() {
    _usernameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                AuthMethods().logOutUser();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: ,
        children: [
          const Center(
            child: Text("My Profile"),
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(user!.photoUrl),
            radius: 60,
          ),
          const Center(child: Text("Change your info")),
          MyTextField(
              controller: _usernameController,
              label: "change username",
              keyboardtype: TextInputType.text,
              hint: user.username,
              obscure: false)
        ],
      ),
    );
  }
}
