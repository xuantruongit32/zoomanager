import 'package:uuid/uuid.dart';
import 'package:zoo/services/models/des_of_house.dart';

var uuid = const Uuid();

class House {
  House({required this.des, required this.online, required this.followers}) : id = uuid.v4();
  House.old({required this.des, required this.online, required this.followers, required this.id});
  DesOfHouse des;
  bool online;
  int followers;
  final String id;
}
