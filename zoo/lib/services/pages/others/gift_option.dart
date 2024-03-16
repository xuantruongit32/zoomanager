import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/network/fire_store.dart';
import 'package:zoo/services/models/donate.dart';
import 'package:zoo/services/models/gift.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/pages/reuseable/auth/errorDialog.dart';

class GiftOptionWidget extends StatelessWidget {
  final Gift gift;
  final Function donate;
  final Function confetti;
  final House house;

  const GiftOptionWidget(
      {Key? key, required this.gift, required this.donate, required this.confetti, required this.house})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Center(
                child: Text(
                  'Confirm Donation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              content: Text(
                'Are you sure want to donate ${gift.name}?',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (DataManager.money < gift.price) {
                      showDialog(
                          context: context,
                          builder: (context) => const ErrorDialog(errorMessage: 'Not enough money')).then((_) {
                        Navigator.of(context).pop();
                      });
                    } else {
                      donate(gift.price);
                      Donate donate1 = Donate(
                          who: house,
                          date: DateTime.now(),
                          giftPrice: gift.price,
                          giftName: gift.name,
                          beforeMoney: DataManager.money + gift.price,
                          afterMoney: DataManager.money);
                      DataManager.donateList.add(donate1);
                      FireStore().addDonateToFireStore(donate1).then((value) {
                        Navigator.of(context).pop();
                        confetti();
                      });
                    }
                  },
                  child: const Text(
                    'Donate',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                gift.avatar,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(8),
            Text(
              gift.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Gap(4),
            Text(
              '\$${gift.price}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const Gap(5),
          ],
        ),
      ),
    );
  }
}
