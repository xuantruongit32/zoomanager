import 'dart:math';

import 'package:confetti/confetti.dart';
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
  late final FlickManager flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(widget.house.video))..setLooping(true),
  );

  late ConfettiController _confettiController;
  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  void _showConfetti() {
    _confettiController.play();
  }

  Path drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step), halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
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
                    house: widget.house,
                    confetti: _showConfetti,
                    gift: gift,
                    donate: widget.donate,
                  ),
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [Colors.green, Colors.blue, Colors.pink, Colors.orange, Colors.purple],
              createParticlePath: drawStar,
            ),
          ),
        ],
      ),
    );
  }
}
