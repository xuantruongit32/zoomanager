import 'package:flutter/material.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPage createState() => _FollowingPage();
}

class _FollowingPage extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: LiveVideo(house: h1),
      ),
    );
  }
}
