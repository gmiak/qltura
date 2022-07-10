// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/service/utils/show_snack_bar.dart';
import 'package:qltura/client/view/components/text_field_input.dart';
import 'package:qltura/client/view/screens/signup_screen.dart';
import 'package:qltura/server/controller/user_controller.dart';

import '../../service/config/responsiveLayout/mobile_screen_layout.dart';
import '../../service/config/responsiveLayout/responsive.dart';
import '../../service/config/responsiveLayout/web_screen_layout.dart';

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
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ),
      ));
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  // Navigate to signup
  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
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
                onTap: loginUser,
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
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Log in'),
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
                    child: const Text("Don't have an account? "),
                  ),
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Sign up",
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
