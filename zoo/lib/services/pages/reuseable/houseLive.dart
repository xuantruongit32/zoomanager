import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/others/gift_option.dart';
import 'package:zoo/services/pages/others/housePage.dart';

class HouseLive extends StatefulWidget {
  final House house;
  final Function donate;
  final Function addFollow;
  final Function removeFollow;

  const HouseLive(
      {super.key, required this.house, required this.donate, required this.addFollow, required this.removeFollow});

  @override
  _HouseLiveState createState() => _HouseLiveState();
}

class _HouseLiveState extends State<HouseLive> {
  late final FlickManager flickManager =
      FlickManager(videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(widget.house.video)));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HousePage(house: widget.house, addFollow: widget.addFollow, removeFollow: widget.removeFollow),
              ),
            );
          },
          child: Row(
            children: [
              Text(widget.house.name),
              const Gap(20),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.house.avatar),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlickVideoPlayer(flickManager: flickManager),
          const Gap(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: DataManager.listGift.map((gift) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GiftOptionWidget(
                    gift: gift,
                    donate: widget.donate,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
