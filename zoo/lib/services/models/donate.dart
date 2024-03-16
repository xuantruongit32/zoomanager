import 'package:uuid/uuid.dart';
import 'package:zoo/services/models/house.dart';

var uuid = const Uuid();

class Donate {
  Donate(
      {required this.date,
      required this.giftPrice,
      required this.beforeMoney,
      required this.afterMoney,
      required this.giftName,
      required this.who})
      : id = uuid.v4();
  final DateTime date;
  final double giftPrice;
  final String giftName;
  final House who;
  final double beforeMoney;
  final double afterMoney;
  final String id;
}
