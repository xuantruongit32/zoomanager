import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/fire_store.dart';
import 'package:zoo/services/pages/others/depositPage.dart';
import 'package:zoo/services/pages/others/privacyPage.dart';
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
  @override
  void initState() {
    super.initState();
  }

  void addFollow(var house) {
    FireStore().addFollowedHouseToFireStore(house).then(
          (value) => DataManager.followList.add(house),
        );
  }

  void removeFollow(var house) {
    FireStore().removeFollowedHouseFromFireStore(house).then((value) {
      DataManager.followList.remove(house);
      print(DataManager.followList.length);
      print(DataManager.followList.length);
      print(DataManager.followList.length);
      print(DataManager.followList.length);
    });
  }

  void donate(double donate) {
    DataManager.money -= donate;
    FireStore().updateMoney();
  }

  String _getName() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.displayName == null) {
        return "No name";
      } else {
        return user.displayName!;
      }
    }
    return '';
  }

  String _getAvatar() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      if (user.photoURL == null) {
        return "https://cdn.tuoitre.vn/zoom/480_300/2022/4/20/photo-1-1650424191062639501281-crop-1650424241729438626691.jpg";
      } else {
        return user.photoURL!;
      }
    }
    return 'https://cdn.tuoitre.vn/zoom/480_300/2022/4/20/photo-1-1650424191062639501281-crop-1650424241729438626691.jpg';
  }

  var _currentIndex = 0;

  late final tabs = [
    FollowingPage(
      addFollow: addFollow,
      removeFollow: removeFollow,
      donate: donate,
    ),
    BrowsePage(
      addFollow: addFollow,
      removeFollow: removeFollow,
      donate: donate,
    ),
    SearchPage(
      addFollow: addFollow,
      removeFollow: removeFollow,
      donate: donate,
    ),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPage(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(_getAvatar()),
              ),
            ),
            const Gap(10),
            Text(
              _getName(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutPage(),
                  ),
                );
              },
              icon: const Icon(LineIcons.dollarSign),
              label: Text(
                DataManager.money.toStringAsFixed(2),
              ),
            ),
          ],
        ),
      ),
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
