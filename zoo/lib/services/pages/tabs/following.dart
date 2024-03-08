import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/others/housePage.dart';
import 'package:zoo/services/pages/reuseable/circle_house.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  void gotoHouse(var house) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HousePage(house: house)));
  }

  bool checkFollowNull = DataManager.followList.isEmpty ? false : true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var house in checkFollowNull ? DataManager.followList : DataManager.recommendedList)
                    CircleHouse(house: house),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                checkFollowNull ? 'Your Live Houses' : 'Recommended for you',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var house in checkFollowNull
                    ? DataManager.followList.where((house) => house.online).toList()
                    : DataManager.recommendedList)
                  LiveVideo(
                    house: house,
                  ),
              ],
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Offline House',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var house in checkFollowNull
                    ? DataManager.followList.where((house) => house.online == false).toList()
                    : DataManager.recommendedList)
                  OfflineHouse(
                    house: house,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
