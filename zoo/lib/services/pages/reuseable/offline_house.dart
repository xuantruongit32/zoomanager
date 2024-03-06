import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OfflineHouse extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final int followers;

  const OfflineHouse({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Gap(4),
              Text(
                'Followers: $followers',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
