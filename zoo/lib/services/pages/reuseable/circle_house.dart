import 'package:flutter/material.dart';
import 'package:zoo/services/models/house.dart';

class CircleHouse extends StatelessWidget {
  const CircleHouse({super.key, required this.house, required this.gotoHouse});
  final House house;
  final Function gotoHouse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            gotoHouse(house);
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(house.avatar),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: house.online ? Colors.red : Colors.grey, shape: BoxShape.circle),
            ))
      ],
    );
  }
}
