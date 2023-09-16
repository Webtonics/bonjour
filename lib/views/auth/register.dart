import 'package:bonjour/resources/authentication/auth_exception.dart';
import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/utils/constants/spacer.dart';
import 'package:bonjour/utils/snackbar.dart';
import 'package:bonjour/utils/uploader/image.dart';
import 'package:bonjour/views/auth/login.dart';
import 'package:bonjour/widget/alert_dialog.dart';
import 'package:bonjour/widget/button.dart';
import 'package:bonjour/widget/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../responsive/mobilescreen_layout.dart';
import '../../responsive/responsive_layout.dart';
import '../../responsive/webscreen_layout.dart';

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
  Uint8List? image;
  bool isloading = false;
  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _bioController = TextEditingController();
    _passwordController = TextEditingController();
    _obsecure = true;
    isloading = false;
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

  selectImage() async {
    Uint8List In = await pickimage(ImageSource.gallery);
    setState(() {
      image = In;
    });
  }

  loading() {
    setState(() {
      isloading = true;
    });
  }

  signUpUser() async {
    try {
      String res = await AuthMethods().signupUser(
        username: _userNameController.text,
        password: _passwordController.text,
        email: _emailController.text,
        bio: _bioController.text,
        file: image!,
      );
      print(res);

      loading();

      if (res != 'Success') {
        showSnackBar(res, context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout(),
            ),
          ),
        );
      } else {
        showSnackBar("Success", context);
      }
    } on WeakPasswordAuthException {
      showalertDialog(
          context, "The password you entered has to be at least 6 characters");
    } on InvalidEmailAuthException {
      showalertDialog(context, "The Email you provided is Incorrect");
    } on MissingPasswordAuthException {
      showalertDialog(context, "The password cannot be null");
    } on EmailAlreadyinUseAuthException {
      showalertDialog(context, "This Email is already in Use");
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

            //circular widget to accept and show selected file
            Stack(
              children: [
                image != null
                    ? CircleAvatar(
                        radius: 64, backgroundImage: MemoryImage(image!))
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            // AssetImage("assets/images/defaultprofile.png"),

                            NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwCcIy04iv-r0Ob5ssiVyTRs8X9qLsLHEOJ78MYiZUMD3mFJBrxFRX&s=0"),
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  // right: 10,
                  child: IconButton(
                    onPressed: selectImage,
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
              child: isloading
                  ? ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 60),
                          maximumSize: const Size(double.infinity, 70)),
                      child: const CircularProgressIndicator(),
                    )
                  : MyButton(title: "Signup", action: signUpUser),
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
