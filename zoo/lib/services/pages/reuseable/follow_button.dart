import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';

// ignore: must_be_immutable
class FollowButton extends StatefulWidget {
  FollowButton({super.key, required this.addFollow, required this.removeFollow, required this.isFollowing});
  final Function? addFollow;
  final Function? removeFollow;
  bool isFollowing;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.isFollowing
            ? showConfirmationSnackbar(context)
            : setState(() {
                widget.addFollow;
                widget.isFollowing = !widget.isFollowing;
              });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: widget.isFollowing ? Colors.grey[300] : Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LineIcons.heart,
              color: widget.isFollowing ? Colors.purple : Colors.white,
            ),
            const Gap(5),
            Text(
              widget.isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                color: widget.isFollowing ? Colors.purple : Colors.white,
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
            widget.removeFollow;
            widget.isFollowing = !widget.isFollowing;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
