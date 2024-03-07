import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class FullLiveVideo extends StatelessWidget {
  const FullLiveVideo({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / (16 / 6),
                child: Image.network(
                  house.cover,
                  fit: BoxFit.cover,
                ),
              ),
              OfflineHouse(house: house),
            ],
          ),
        ),
      ],
    );
  }
}
