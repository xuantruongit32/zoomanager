import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/others/gift_option.dart';

class HouseLive extends StatefulWidget {
  final House house;

  const HouseLive({super.key, required this.house});

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
        title: Text(widget.house.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FlickVideoPlayer(flickManager: flickManager),
          const Gap(10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: DataManager.listGift.map((gift) {
                return GiftOptionWidget(gift: gift);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
