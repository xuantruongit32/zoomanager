import 'package:aplanet/screen/dashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:aplanet/common/custom_app_bar.dart';
import 'package:aplanet/common/subscriptionContainer.dart';
import 'package:aplanet/utils/text_style.dart';

class ChoosePlanScreen extends StatelessWidget {
  const ChoosePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB98959),
      body: Stack(children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Text(
                'Choose a plan',
                style: TextStyles.headingTextStyle,
              ),
            ),
            SubscriptionContainer(
                amount: "1.99",
                text: "Week subscription",
                imagePath: "assets/lion.jpg"),
            SubscriptionContainer(
                amount: "4.99",
                text: "1 Month subscription",
                imagePath: "assets/wolf.jpg"),
            SubscriptionContainer(
                amount: "9.99",
                text: "3 Month subscription",
                imagePath: "assets/animal3.jpg"),
            SubscriptionContainer(
                amount: "12",
                text: "6 Month subscription",
                imagePath: "assets/fox.jpg"),
          ],
        ),
        Positioned(
          bottom: 48,
          left: 16,
          child: Text(
            'Last step to enjoy',
            style: TextStyles.buttonTextStyle,
          ),
        ),
        Positioned(
          bottom: -30,
          right: -30,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(),
                ),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.brown,
              ),
              child: const Align(
                alignment: Alignment(-0.3, -0.3),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
