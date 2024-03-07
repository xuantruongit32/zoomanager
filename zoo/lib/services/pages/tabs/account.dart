import 'package:flutter/material.dart';
import 'package:zoo/services/pages/others/fullLiveVideoList.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return FullLiveVideoList();
  }
}
