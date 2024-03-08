import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
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
  var _currentIndex = 0;

  final tabs = [
    FollowingPage(),
    BrowsePage(),
    SearchPage(),
    AccountPage(),
  ];
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
