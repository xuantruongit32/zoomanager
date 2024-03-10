import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/fire_store.dart';
import 'package:zoo/services/pages/others/housePage.dart';
import 'package:zoo/services/pages/tabs/account.dart';
import 'package:zoo/services/pages/tabs/browse.dart';
import 'package:zoo/services/pages/tabs/following.dart';
import 'package:zoo/services/pages/tabs/search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addFollow(var house) {
    DataManager.followList.add(house);
    FireStore().updateFollowList();
  }

  void removeFollow(var house) {
    DataManager.followList.remove(house);
    FireStore().updateFollowList();
  }

  void gotoHouse(var house) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HousePage(
          house: house,
          addFollow: addFollow,
          removeFollow: removeFollow,
        ),
      ),
    );
  }

  var _currentIndex = 0;

  late final tabs = [
    FollowingPage(
      addFollow: addFollow,
      removeFollow: removeFollow,
    ),
    BrowsePage(
      addFollow: addFollow,
      removeFollow: removeFollow,
    ),
    SearchPage(
      addFollow: addFollow,
      removeFollow: removeFollow,
    ),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        fixedColor: Colors.deepPurple,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(LineIcons.heart), label: 'Following'),
          BottomNavigationBarItem(icon: Icon(LineIcons.square), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(LineIcons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(LineIcons.user), label: 'Account'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
