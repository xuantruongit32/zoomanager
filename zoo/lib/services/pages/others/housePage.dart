import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/models/house.dart';

class HousePage extends StatelessWidget {
  const HousePage({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(house.des.cover),
                  ),
                  // Background cover
                  // Avatar and content
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(house.des.avatar),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            children: [
                              const Gap(25),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  house.des.name,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Adjust text color as needed
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  house.followers.toString() + ' Followers',
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              house.des.story,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            Row(
              children: [TextButton.icon(onPressed: () {}, icon: Icon(Icons.heart_broken), label: Text('Follow'))],
            )
          ],
        ),
      ),
    );
  }
}