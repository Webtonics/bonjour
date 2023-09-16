import 'package:bonjour/resources/authentication/auth_exception.dart';
import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/utils/constants/spacer.dart';
import 'package:bonjour/utils/snackbar.dart';
import 'package:bonjour/views/auth/register.dart';
import 'package:bonjour/widget/alert_dialog.dart';
import 'package:bonjour/widget/button.dart';
import 'package:bonjour/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../responsive/mobilescreen_layout.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/webscreen_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late bool _obsecure;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _obsecure = true;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  viewPass() {
    _obsecure = false;
  }

  void signUserIn() async {
    try {
      String result = await AuthMethods()
          .signInUser(_emailController.text, _passwordController.text);

      if (result == "Success") {
        // ignore: use_build_context_synchronously
        showSnackBar(result, context);
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout(),
            ),
          ),
        );
      } else {
        showSnackBar(result, context);
      }
      // Navigator.of(context).pop();
    } on WrongPasswordAuthException {
      showalertDialog(context, 'The Password you provided is Incorrect');
    } on UserNotFoundAuthException {
      showalertDialog(
          context, 'The Account you are trying to login does not Exist');
    } catch (e) {
      print(e.toString());
    }
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
            const SizedBox(
              height: 60,
            ),
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
            // button
            MyButton(
              title: "Signin",
              action: signUserIn,
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
                      "Don't have an account?",
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
                        builder: (context) => const RegisterScreen())),
                    child: Container(
                      child: const Text(
                        "Signup",
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
