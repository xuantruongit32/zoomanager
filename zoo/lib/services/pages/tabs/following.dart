import 'package:flutter/material.dart';
import 'package:zoo/services/models/des_of_house.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/others/housePage.dart';

class FollowingPage extends StatefulWidget {
  FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPage createState() => _FollowingPage();
}

class _FollowingPage extends State<FollowingPage> {
  House h1 = House(
    des: DesOfHouse(
      name: 'Cozy Cottage',
      num: 1,
      species: 'Cottage',
      story: 'A quaint little cottage nestled in the woods.',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
    ),
    online: true,
    followers: 1000,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HousePage(house: h1),
    );
  }
}
