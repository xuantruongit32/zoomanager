import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/circle_house.dart';
import 'package:zoo/services/pages/reuseable/live_video.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({
    Key? key,
    required this.addFollow,
    required this.removeFollow,
    required this.donate,
  }) : super(key: key);
  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  bool checkFollowNull = DataManager.followList.isNotEmpty;
  List<House> listHouseOnline = List.from(DataManager.followList);
  @override
  void initState() {
    listHouseOnline.sort((a, b) => b.online! ? 1 : -1);
    List<House> total = List.from(DataManager.listHouse);
    total.sort((a, b) => b.online! ? 1 : -1);
    listHouseOnline.addAll(
      total.where(
        (element) => !listHouseOnline.contains(element),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: checkFollowNull
              ? [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var house in listHouseOnline)
                          CircleHouse(
                            donate: widget.donate,
                            house: house,
                            addFollow: widget.addFollow,
                            removeFollow: widget.removeFollow,
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
                      for (var house in DataManager.followList.where((house) => house.online!).toList())
                        LiveVideo(
                          addFollow: widget.addFollow,
                          removeFollow: widget.removeFollow,
                          donate: widget.donate,
                          house: house,
                        ),
                    ],
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Your Recommeded Houses',
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
                      for (var house in DataManager().getRecommendList(5).where((house) => house.online!).toList())
                        LiveVideo(
                          addFollow: widget.addFollow,
                          removeFollow: widget.removeFollow,
                          donate: widget.donate,
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
                      for (var house in DataManager.followList.where((house) => house.online == false).toList())
                        OfflineHouse(
                          donate: widget.donate,
                          addFollow: widget.addFollow,
                          removeFollow: widget.removeFollow,
                          house: house,
                        ),
                    ],
                  ),
                ]
              : [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (var house in listHouseOnline)
                          CircleHouse(
                            donate: widget.donate,
                            house: house,
                            addFollow: widget.addFollow,
                            removeFollow: widget.removeFollow,
                          ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Your Recommeded Houses',
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
                      for (var house in DataManager().getRecommendList(10).where((house) => house.online!).toList())
                        LiveVideo(
                          addFollow: widget.addFollow,
                          removeFollow: widget.removeFollow,
                          donate: widget.donate,
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
