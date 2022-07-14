// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/service/utils/select_image.dart';
import 'package:qltura/client/service/utils/show_snack_bar.dart';
import 'package:qltura/client/view/components/text_field_input.dart';
import 'package:qltura/client/view/screens/login_screen.dart';
import 'package:qltura/server/controller/user_controller.dart';

import '../../service/config/responsiveLayout/mobile_screen_layout.dart';
import '../../service/config/responsiveLayout/responsive.dart';
import '../../service/config/responsiveLayout/web_screen_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  // ignore: prefer_final_fields
  bool _isLoading = false;

  // Dispose for cleaning up the textfield
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  // Select profile image
  void selectImage() async {
    Uint8List pic = await pickImage(ImageSource.gallery);
    setState(() {
      _image = pic;
    });
  }

  // Signup user
  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await UserController().signup(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      file: _image ?? await loadDefaultAvatar(),
    );
    setState(() {
      _isLoading = false;
    });
    if (res == "success") {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
  }

  // Navigate to signup
  void navigateTologin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // space on the top
              Flexible(flex: 2, child: Container()),
              // logo
              Image.asset(
                'assets/logo_text.png',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 34),
              // Circular widget to accept and show our selected profile pic
              Stack(
                children: [
                  // ignore: unnecessary_null_comparison
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('assets/avatar.png'),
                          ),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Text field input for username
              TextFieldInput(
                  textEditingController: _usernameController,
                  hinText: "Enter your username",
                  textInputType: TextInputType.text),
              const SizedBox(height: 24),
              // Text field input for email
              TextFieldInput(
                  textEditingController: _emailController,
                  hinText: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24),
              // Text field input for password
              TextFieldInput(
                textEditingController: _passwordController,
                hinText: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24),
              // Button login with container
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      color: blueColor),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Sign up'),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                  flex: 2,
                  child: Container()), // Put this section on the bottom
              // Transitioning to signing up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already have an account? "),
                  ),
                  GestureDetector(
                    onTap: navigateTologin,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
