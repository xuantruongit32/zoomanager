import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Species {
  Species({required this.name, required this.avatar, required this.des}) : id = uuid.v4();
  Species.old({required this.name, required this.avatar, required this.id, required this.des});
  String name;
  String avatar;
  String des;
  final String id;
}
