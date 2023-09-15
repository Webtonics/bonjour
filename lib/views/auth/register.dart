import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/utils/constants/spacer.dart';
import 'package:bonjour/views/auth/login.dart';
import 'package:bonjour/views/auth/register.dart';
import 'package:bonjour/widget/button.dart';
import 'package:bonjour/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late bool _obsecure;
  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _bioController = TextEditingController();
    _passwordController = TextEditingController();
    _obsecure = true;
    super.initState();
  }

  @override
  void dispose() {
    _bioController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  viewPass() {
    _obsecure = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            //logo
            Container(
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                child: SvgPicture.asset(
                  "assets/images/ic_instagram.svg",
                  color: primaryColor,
                  height: 64,
                )
                //  const Image(
                // image: AssetImage("assets/images/bonjour_full.png"))
                ),
            spacing,

            //circular widget to accept and show selected file
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80"),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  // right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                    color: Colors.white70,
                  ),
                ),
              ],
            ),

            spacing,
            const SizedBox(
              height: 60,
            ),
            //username field
            MyTextField(
              controller: _userNameController,
              label: "Username",
              keyboardtype: TextInputType.emailAddress,
              hint: 'John Doe',
              obscure: false,
            ),

            spacing,
            //email field
            MyTextField(
              controller: _emailController,
              label: "Email address",
              keyboardtype: TextInputType.emailAddress,
              hint: 'example@gmail.com',
              obscure: false,
            ),
            spacing,

            // password field
            MyTextField(
                icon: _obsecure ? Icons.visibility : Icons.visibility_off,
                iconAction: () {
                  setState(() {
                    _obsecure = !_obsecure;
                  });
                },
                controller: _passwordController,
                label: "Password",
                keyboardtype: TextInputType.text,
                hint: '.......',
                obscure: _obsecure),

            spacing,
            //bio
            MyTextField(
              controller: _bioController,
              label: "Bio",
              keyboardtype: TextInputType.multiline,
              hint: 'Enter your Bio',
              obscure: false,
            ),

            spacing,
            // button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                  title: "Signup",
                  action: () async {
                    String res = await AuthMethods().signupUser(
                      username: _userNameController.text,
                      password: _passwordController.text,
                      email: _emailController.text,
                      bio: _bioController.text,
                    );
                    print(res);
                  }),
            ),
            spacing,
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen())),
                    child: Container(
                      child: const Text(
                        "Signin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
