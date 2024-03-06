import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/others/housePage.dart';
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
                  for (var house in DataManager.listHouse)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HousePage(house: house)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(house.des.avatar),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Your Live Houses',
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
                for (var house in DataManager.listHouse)
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
                for (var house in DataManager.listHouse)
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
