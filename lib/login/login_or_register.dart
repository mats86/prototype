import 'package:flutter/material.dart';
import 'package:prototype/login/register_page.dart';

import 'login_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegister();
}

class _LoginOrRegister extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return RegisterPage(onTap: togglePage);
    } else {
      return LoginPage(onTap: togglePage);
    }
  }
}
