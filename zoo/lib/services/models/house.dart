import 'package:zoo/services/models/des_of_house.dart';

class House {
  const House(
      {required this.des, required this.online, required this.followers});
  final DesOfHouse des;
  final bool online;
  final int followers;
}
