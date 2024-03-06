import 'package:flutter/material.dart';
import 'package:zoo/services/models/house.dart';

class FullLiveVideo extends StatelessWidget {
  const FullLiveVideo({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width / (16 / 9),
          child: Image.network(
            house.des.cover,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
