import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/others/housePage.dart';

class OfflineHouse extends StatelessWidget {
  const OfflineHouse({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HousePage(house: house)));
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(house.avatar),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  house.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Gap(4),
                Text(
                  'Followers: ${house.followers.toString()}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
