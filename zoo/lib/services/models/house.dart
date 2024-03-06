import 'package:uuid/uuid.dart';
import 'package:zoo/services/models/des_of_house.dart';
import 'package:zoo/services/models/species.dart';

var uuid = const Uuid();

class House {
  House({required this.des, required this.online, required this.followers, required this.species}) : id = uuid.v4();
  House.old(
      {required this.des, required this.online, required this.followers, required this.id, required this.species});
  DesOfHouse des;
  bool online;
  int followers;
  Species species;
  final String id;
}
