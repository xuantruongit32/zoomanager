import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/follow_button.dart';
import 'package:zoo/services/pages/reuseable/houseLive.dart';

class HousePage extends StatelessWidget {
  const HousePage(
      {Key? key,
      required this.house,
      required this.addFollow,
      required this.removeFollow,
      required this.donate})
      : super(key: key);

  final Function addFollow;
  final Function removeFollow;
  final Function donate;
  final House house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(house.cover!),
                  ),
                  // Background cover
                  // Avatar and content
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(house.avatar!),
                        ),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            children: [
                              const Gap(25),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  house.name!,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  house.followers.toString() + ' Followers',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                house.story!,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  FollowButton(
                    removeFollow: removeFollow,
                    addFollow: addFollow,
                    house: house,
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap: house.online!
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HouseLive(
                                    house: house,
                                    donate: donate,
                                    addFollow: addFollow,
                                    removeFollow: removeFollow),
                              ),
                            );
                          }
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                    child: Text('No Live Stream Available')),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: house.online! ? Colors.purple : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LineIcons.video,
                            color: house.online! ? Colors.white : Colors.purple,
                          ),
                          const Gap(5),
                          Text(
                            'Live Stream',
                            style: TextStyle(
                              color:
                                  house.online! ? Colors.white : Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
