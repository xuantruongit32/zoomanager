import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Gift {
  Gift.old({required this.name, required this.price, required this.avatar, required this.id});
  Gift({required this.name, required this.price, required this.avatar}) : id = uuid.v4();
  String name;
  double price;
  String avatar;
  final String id;
}
