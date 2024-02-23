import 'package:flutter/material.dart';
import 'package:zoo/auth/login.dart';
import 'package:zoo/auth/register.dart';

class LoginOrRegister extends StatefulWidget {
  LoginOrRegister({Key? key}) : super(key: key);

  @override
  _LoginOrRegisterState createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;
  void changePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showLoginPage
        ? Login(
            onTap: changePage,
          )
        : Register(
            onTap: changePage,
          ));
  }
}
