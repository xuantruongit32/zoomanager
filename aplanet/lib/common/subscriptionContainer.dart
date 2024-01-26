import 'package:flutter/material.dart';
import 'package:aplanet/utils/text_style.dart';

class SubscriptionContainer extends StatelessWidget {
  const SubscriptionContainer(
      {required this.amount,
      required this.text,
      required this.imagePath,
      Key? key})
      : super(key: key);
  final String amount, text, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
              child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcATop,
            ),
            child: Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.height * 0.6 / 4,
              width: MediaQuery.of(context).size.width - 32,
              fit: BoxFit.fitWidth,
            ),
          )),
          Positioned(
            top: 0,
            bottom: 0,
            left: 32,
            right: 32,
            child: Row(children: [
              Text(
                text,
                style: TextStyles.subscriptionTextStyle,
              ),
              const Spacer(),
              Text(
                '\$' + amount,
                style: TextStyles.subscriptionAmountTextStyle,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
