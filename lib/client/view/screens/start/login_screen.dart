// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/text_field_input.dart';
import 'package:qltura/client/view/screens/start/signup_screen.dart';
import 'package:qltura/server/controller/user_controller.dart';
import '../../../service/config/responsiveLayout/mobile_screen_layout.dart';
import '../../../service/config/responsiveLayout/responsive.dart';
import '../../../service/config/responsiveLayout/web_screen_layout.dart';
import '../../../service/utils/utils_uno.dart';
import '../../components/logo_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: prefer_final_fields
  bool _isLoading = false;

  // Dispose for cleaning up textfield are
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // loginUser
  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await UserController().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
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
    setState(() {
      _isLoading = false;
    });
  }

  // navigates to signup
  navigateToSignup() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shrinkWrap: true,
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 34),
                  const LogoText(), // logo
                  const SizedBox(height: 24),
                  // Text field input for email
                  TextFieldInput(
                      textEditingController: _emailController,
                      hinText: "Phone number, username or email address",
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 12),
                  // Text field input for password
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hinText: "Password",
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                  const SizedBox(height: 12),
                  // Button login with container
                  InkWell(
                    onTap: loginUser,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          color: brandColor),
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: appBackgroundColor,
                              ),
                            )
                          : const Text(
                              'Log in',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            // Button forgotten password
            Container(
              alignment: Alignment.topCenter,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgotten password?'),
              ),
            ),
            const SizedBox(height: 34),

            // Transitioning to signing up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: hideLinkTextColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: navigateToSignup,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: linkColor),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
