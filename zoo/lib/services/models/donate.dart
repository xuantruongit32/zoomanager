import 'package:zoo/services/models/gift.dart';

class Donate {
  Donate({required this.date, required this.gift, required this.beforeMoney, required this.afterMoney});
  final DateTime date;
  final Gift gift;
  final double beforeMoney;
  final double afterMoney;
}
