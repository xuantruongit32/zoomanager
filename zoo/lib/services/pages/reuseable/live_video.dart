import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/houseLive.dart';

class LiveVideo extends StatelessWidget {
  const LiveVideo({Key? key, required this.house}) : super(key: key);

  final House house;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HouseLive(house: house)));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: AspectRatio(
                aspectRatio: 16 / 12, // Adjust aspect ratio as needed
                child: Image.network(
                  house.cover,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(house.avatar),
                      ),
                      const Gap(8),
                      Text(
                        house.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Gap(8),
                  SizedBox(
                    width: double.infinity, // Ensure the container takes full width
                    child: Text(
                      "House with ${house.num.toString()} members",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    child: Text(house.species.name),
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
