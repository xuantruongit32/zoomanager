import 'package:flutter/material.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/fullLiveVideo.dart';

class FullLiveVideoList extends StatelessWidget {
  const FullLiveVideoList({super.key, required this.houseList});

  final List<House> houseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: houseList.isEmpty
          ? const Center(
              child: Text(
                'No live house available',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [for (var house in houseList) FullLiveVideo(house: house)],
              ),
            ),
    );
  }
}
