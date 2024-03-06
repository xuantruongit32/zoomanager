import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Species {
  Species({required this.name, required this.avatar}) : id = uuid.v4();
  Species.old({required this.name, required this.avatar, required this.id});
  String name;
  String avatar;
  final String id;
}
