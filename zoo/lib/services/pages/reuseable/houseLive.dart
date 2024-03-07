import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/gift.dart';

class HouseLive extends StatefulWidget {
  final House house;
  final List<Gift> gifts;

  HouseLive({required this.house, required this.gifts});

  @override
  _HouseLiveState createState() => _HouseLiveState();
}

class _HouseLiveState extends State<HouseLive> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    Uri uri = Uri.parse(widget.house.video);
    _controller = VideoPlayerController.networkUrl(uri);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
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
          // Video Player Widget for house video with infinite loop
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return AspectRatio(
                  aspectRatio: 16 / 9, // Placeholder aspect ratio
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
          SizedBox(height: 20), // Add some spacing between video and gift row
          // Row of gift options
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.gifts.map((gift) {
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
