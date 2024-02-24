import 'package:flutter/material.dart';
import 'package:zoo/services/models/house.dart';

class HousePage extends StatelessWidget {
  const HousePage({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 200,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(house.des.image),
                ),
              ],
            ),
          ),
        ])));
  }
}
