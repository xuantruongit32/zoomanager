import 'package:uuid/uuid.dart';
import 'package:zoo/services/models/gift.dart';

var uuid = const Uuid();

class Donate {
  Donate({required this.date, required this.gift, required this.beforeMoney, required this.afterMoney})
      : id = uuid.v4();
  final DateTime date;
  final Gift gift;
  final double beforeMoney;
  final double afterMoney;
  final String id;
  Donate.old(
      {required this.date, required this.gift, required this.beforeMoney, required this.afterMoney, required this.id});
}
