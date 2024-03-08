import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/gift.dart';

class HouseLive extends StatefulWidget {
  final House house;

  HouseLive({required this.house});

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
          SizedBox(height: 10),
          // Row of gift options
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

class GiftOptionWidget extends StatelessWidget {
  final Gift gift;

  GiftOptionWidget({required this.gift});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirm Donation'),
                content: Text('Are you sure you want to donate ${gift.name}?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implement donation logic here
                      // For example, deduct user's balance and update UI
                      Navigator.of(context).pop();
                    },
                    child: Text('Donate'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                gift.avatar,
                width: 100, // Adjust this size as needed
                height: 100, // Adjust this size as needed
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              gift.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${gift.price}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ), // You can format price as needed
          ],
        ),
      ),
    );
  }
}
