import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoo/auth/login_or_register.dart';
import 'package:zoo/services/pages/others/loadingPage.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const LoadingPage();
          } else {
            return LoginOrRegister();
          }
        }),
      ),
    );
  }
}
