import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prototype/home_page.dart';
import 'package:prototype/login/register_page.dart';
import '../components/my_button.dart';
import '../components/my_textField.dart';

class LoginResult {
  final bool success;
  final String message;

  LoginResult({required this.success, required this.message});
}

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

                // App name
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot Password?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                  ],
                ),

                const SizedBox(
                  height: 24.0,
                ),

                MyButton(
                  text: "Login",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
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
                    Text("Don't have an account?",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary)),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        " Register Here",
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
