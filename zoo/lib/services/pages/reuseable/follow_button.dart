import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';

// ignore: must_be_immutable
class FollowButton extends StatefulWidget {
  FollowButton({super.key, required this.addFollow, required this.removeFollow, required this.house});
  final Function? addFollow;
  final Function? removeFollow;
  final House house;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  late bool isFollowing;
  @override
  void initState() {
    isFollowing = DataManager.checkHouseInListFollow(widget.house.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isFollowing
            ? showConfirmationSnackbar(context)
            : setState(() {
                widget.addFollow!(widget.house);
                isFollowing = !isFollowing;
              });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isFollowing ? Colors.grey[300] : Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LineIcons.heart,
              color: isFollowing ? Colors.purple : Colors.white,
            ),
            const Gap(5),
            Text(
              isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                color: isFollowing ? Colors.purple : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmationSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Are you sure?'),
      action: SnackBarAction(
        label: 'Yes',
        onPressed: () {
          setState(() {
            widget.removeFollow!(widget.house);
            isFollowing = !isFollowing;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
