import 'package:aplanet/screen/animalInfo.dart';
import 'package:flutter/material.dart';
import 'package:aplanet/common/custom_app_bar.dart';
import 'package:aplanet/utils/text_style.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF98959),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.40,
            child: Container(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/elephant.png',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  const Column(
                    children: [
                      CustomAppBar(),
                      Expanded(
                        child: Align(
                          alignment: Alignment(0, -0.6),
                          child: Text(
                            'Welcome to New Aplanet',
                            style: TextStyles.bigHeadingTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                color: Color(0xFFB98959),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Text(
                        'Related to you',
                        style: TextStyles.buttonTextStyle,
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'assets/lion.jpg',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    'Life with a lion',
                                    style: TextStyles.titleTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lectus eget mi vestibulum ultrices a eget mauris. Vivamus commodo ex nec justo fermentum, a posuere quam vestibulum.',
                                    style: TextStyles.body3TextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(left: 16),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        'assets/lion.jpg',
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      'Life with a lion',
                                      style: TextStyles.titleTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lectus eget mi vestibulum ultrices a eget mauris. Vivamus commodo ex nec justo fermentum, a posuere quam vestibulum.',
                                      style: TextStyles.body3TextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    child: Image.asset(
                                      'assets/lion.jpg',
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    'Life with a lion',
                                    style: TextStyles.titleTextStyle,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac lectus eget mi vestibulum ultrices a eget mauris. Vivamus commodo ex nec justo fermentum, a posuere quam vestibulum.',
                                    style: TextStyles.body3TextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Text(
                        'Your favorite animal',
                        style: TextStyles.titleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnimalInfoWidget(
                                        image: 'assets/bear.jpg',
                                        species: 'Bear',
                                        name: 'Lu',
                                        age: 4,
                                        gender: 'Male'),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFFB98959),
                                  ),
                                  child: Image.asset(
                                    'assets/bear.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'BEAR',
                                style: TextStyles.body2TextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFB98959),
                                ),
                                child: Image.asset(
                                  'assets/bear.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'BEAR',
                                style: TextStyles.body2TextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFB98959),
                                ),
                                child: Image.asset(
                                  'assets/bear.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'BEAR',
                                style: TextStyles.body2TextStyle,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFB98959),
                                ),
                                child: Image.asset(
                                  'assets/bear.png',
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'BEAR',
                                style: TextStyles.body2TextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
