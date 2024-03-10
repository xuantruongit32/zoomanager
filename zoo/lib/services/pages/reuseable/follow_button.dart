import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:line_icons/line_icons.dart';

class FollowButton extends StatefulWidget {
  const FollowButton({super.key, required this.addFollow, required this.removeFollow});
  final Function? addFollow;
  final Function? removeFollow;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _isFollowing
            ? showConfirmationSnackbar(context)
            : setState(() {
                widget.addFollow;
                _isFollowing = !_isFollowing;
              });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: _isFollowing ? Colors.grey[300] : Colors.purple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LineIcons.heart,
              color: _isFollowing ? Colors.purple : Colors.white,
            ),
            const Gap(5),
            Text(
              _isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                color: _isFollowing ? Colors.purple : Colors.white,
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
            _isFollowing = !_isFollowing;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
