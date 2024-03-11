import 'package:flutter/material.dart';
import 'package:zoo/network/fire_store.dart';
import 'package:zoo/services/pages/others/homePage.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  Future<bool> fetchData() async {
    try {
      await FireStore().fetchData();
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return HomePage();
          }
        },
      ),
    );
  }
}
