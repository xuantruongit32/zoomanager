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
            Container(
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
                        Expanded(
                          child: Column(
                            children: [
                              const Gap(25),
                              Text(
                                house.des.name,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Adjust text color as needed
                                ),
                              ),
                              const Text(
                                "Last live yesterday",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black, // Adjust text color as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
