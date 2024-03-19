import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoo/auth/login_or_register.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/network_request.dart';
import 'package:zoo/services/pages/others/loadingPage.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
       NetworkRequest.fetchListHouse().then((value) {
         NetworkRequest.fetchListGift().then(
       (value1) => DataManager.listGift = value1,
        );
      setState(() {
         DataManager.listHouse = value; 
      });
    });
    super.initState();
  }
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
