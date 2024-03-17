import 'package:flutter/material.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/houseLive.dart';
import 'package:zoo/services/pages/reuseable/offline_house.dart';

class FullLiveVideo extends StatelessWidget {
  const FullLiveVideo(
      {super.key, required this.house, required this.addFollow, required this.removeFollow, required this.donate});

  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  final House house;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HouseLive(
              addFollow: addFollow,
              removeFollow: removeFollow,
              house: house,
              donate: donate,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width / (16 / 9),
                      child: Image.network(
                        house.cover!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    OfflineHouse(
                      house: house,
                      addFollow: addFollow,
                      removeFollow: removeFollow,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              top: 30,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  'Live',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
