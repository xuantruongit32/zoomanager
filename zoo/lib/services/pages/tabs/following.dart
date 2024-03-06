import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Your Live Houses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: DataManager.listHouse.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return LiveVideo(
                    house: DataManager.listHouse[i],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
