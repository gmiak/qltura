// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/text_field_input.dart';
import 'package:qltura/server/db/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  // Dispose for cleaning up textfield are
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: SingleChildScrollView(
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
                  children: const [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://www.mtsolar.us/wp-content/uploads/2020/04/avatar-placeholder.png'),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: null,
                        icon: Icon(
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
                  onTap: () async {
                    String res = await AuthMethods().signUpUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        username: _usernameController.text);
                    print(res);
                  },
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
                    child: const Text('Sign up'),
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
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          "Log in",
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
      ),
    );
  }
}
