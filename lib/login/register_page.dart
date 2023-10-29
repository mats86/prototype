import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prototype/login/login_page.dart';
import '../components/my_button.dart';
import '../components/my_textField.dart';

class RegisterResult {
  final bool success;
  final String message;

  RegisterResult({required this.success, required this.message});
}

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(
                  height: 24.0,
                ),

                // App Name
                const Text(
                  'Schwimmschule Allgäu',
                  style: TextStyle(fontSize: 18.0),
                ),

                const SizedBox(
                  height: 48.0,
                ),

                MyTextField(
                    hintText: "Email / Username / Handynummer",
                    obscureText: false,
                    controller: emailController),

                const SizedBox(
                  height: 12.0,
                ),

                // App name
                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController),

                const SizedBox(
                  height: 12.0,
                ),

                MyTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    controller: confirmPwController),

                const SizedBox(
                  height: 24.0,
                ),

                MyButton(
                  text: "Register",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(onTap: (){}),
                      ),
                    );
                  }
                ),

                const SizedBox(
                  height: 24.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
