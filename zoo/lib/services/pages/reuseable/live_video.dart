import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/models/house.dart';

class LiveVideo extends StatelessWidget {
  const LiveVideo({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add onTap functionality if needed
      },
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AspectRatio(
              aspectRatio: 16 / 9, // Adjust aspect ratio as needed
              child: Image.network(
                house.des.cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(house.des.avatar),
                        ),
                        const Gap(8),
                        Text(
                          house.des.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("House with ${house.des.num.toString()} members")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
