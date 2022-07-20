import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/logo_text.dart';
import 'package:qltura/client/view/screens/start/login_screen.dart';
import 'package:qltura/client/view/screens/start/signup_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // navigates to signup
  navigateToSignup() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
        (route) => false);
  }

  // navigates to login
  navigateToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: todo
              // TODO: Create selector for language

              // space on the top
              Flexible(flex: 2, child: Container()),
              // logo
              const LogoText(),
              const SizedBox(height: 24),
              // Button create new account
              InkWell(
                onTap: navigateToSignup,
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
                  child: const Text(
                    'Create new account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Button log in
              TextButton(
                onPressed: navigateToLogin,
                child: const Text(
                  'Log in',
                  style:
                      TextStyle(color: linkColor, fontWeight: FontWeight.bold),
                ),
              ),
              // Space
              Flexible(flex: 2, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
