import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/services/models/gift.dart';

class GiftOptionWidget extends StatelessWidget {
  final Gift gift;

  const GiftOptionWidget({super.key, required this.gift});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Confirm Donation'),
                content: Text('Are you sure you want to donate ${gift.name}?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Donate'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                gift.avatar,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(5),
            Text(
              gift.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${gift.price}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
