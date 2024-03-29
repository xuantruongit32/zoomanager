import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gap/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoo/services/pages/others/depositPage.dart';
import 'package:zoo/services/pages/others/historyPage.dart';
import 'package:zoo/services/pages/others/privacyPage.dart';
import 'package:zoo/services/pages/reuseable/customIcon.dart';
import 'package:zoo/services/pages/reuseable/iconButtonText.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key, required this.addFollow, required this.removeFollow, required this.donate})
      : super(key: key);
  final Function addFollow;
  final Function removeFollow;
  final Function donate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonText(
                  fun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutPage(),
                      ),
                    );
                  },
                  label: 'Donation',
                  icon: CustomIcon(imagePath: 'assets/icon/donation.png'),
                ),
                IconButtonText(
                  fun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryPage(
                          addFollow: addFollow,
                          donate: donate,
                          removeFollow: removeFollow,
                        ),
                      ),
                    );
                  },
                  label: 'History',
                  icon: CustomIcon(
                    imagePath: 'assets/icon/history.png',
                  ),
                ),
              ],
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButtonText(
                  fun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPage(),
                      ),
                    );
                  },
                  label: 'Privacy',
                  icon: CustomIcon(imagePath: 'assets/icon/privacy.png'),
                ),
                IconButtonText(
                  fun: () {
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
                    GoogleSignIn().disconnect();
                  },
                  label: 'Sign Out',
                  icon: CustomIcon(imagePath: 'assets/icon/log-out.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
