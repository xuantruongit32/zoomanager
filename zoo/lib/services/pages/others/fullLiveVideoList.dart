import 'package:flutter/material.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/pages/reuseable/fullLiveVideo.dart';

class FullLiveVideoList extends StatelessWidget {
  const FullLiveVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [for (var house in DataManager.listHouse) FullLiveVideo(house: house)],
      ),
    );
  }
}
