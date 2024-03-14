import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/houseLive.dart';

class LiveVideo extends StatelessWidget {
  const LiveVideo(
      {Key? key, required this.house, required this.donate, required this.addFollow, required this.removeFollow})
      : super(key: key);

  final House house;
  final Function donate;
  final Function addFollow;
  final Function removeFollow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
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
                        width: double.infinity,
                        child: Text(
                          "House with ${house.num.toString()} members",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(const Color(0xFFD2D2D2)),
                        ),
                        child: Text(
                          house.species.name,
                          style: const TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 35,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
