import 'package:flutter/material.dart';
import 'package:aplanet/utils/text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 48,
        left: 16,
        right: 16,
      ),
      child: Row(children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "aplanet", style: TextStyles.appNameTextStyle),
              const TextSpan(text: "\n"),
              const TextSpan(
                text: 'We love the planet',
                style: TextStyles.tagLineTextStyle,
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(Icons.menu, color: Colors.white),
      ]),
    );
  }
}
