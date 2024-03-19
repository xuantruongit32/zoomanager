import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:zoo/auth/authPage.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/network_request.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(App()));
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    NetworkRequest.fetchListHouse().then((value) => DataManager.listHouse = value);
    NetworkRequest.fetchListGift().then((value) => DataManager.listGift = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
