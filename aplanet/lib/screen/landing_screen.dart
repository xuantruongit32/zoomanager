import 'package:aplanet/screen/choosePlanScreen.dart';
import 'package:flutter/material.dart';
import 'package:aplanet/common/custom_app_bar.dart';
import 'package:aplanet/utils/text_style.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/elephant.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
          ),
          Column(
            children: [
              CustomAppBar(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 32, left: 32, right: 32),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Ready to watch?',
                      style: TextStyles.bigHeadingTextStyle),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lectus eget mi vestibulum ultrices a eget mauris. Vivamus commodo ex nec justo fermentum, a posuere quam vestibulum',
                    style: TextStyles.bodyTextStyle,
                  ),
                  TextSpan(text: "\n"),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: 'Start Enjoying',
                    style: TextStyles.buttonTextStyle,
                  ),
                ])),
              )
            ],
          ),
          Positioned(
            bottom: -30,
            right: -30,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChoosePlanScreen(),
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
        ],
      ),
    );
  }
}
