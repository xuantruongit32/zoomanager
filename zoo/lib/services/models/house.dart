import 'package:uuid/uuid.dart';
import 'package:zoo/services/models/species.dart';

var uuid = const Uuid();

class House {
  House(
      {required this.name,
      required this.online,
      required this.followers,
      required this.species,
      required this.num,
      required this.story,
      required this.avatar,
      required this.cover,
      required this.video})
      : id = uuid.v4();
  House.old(
      {required this.name,
      required this.online,
      required this.followers,
      required this.species,
      required this.num,
      required this.story,
      required this.avatar,
      required this.cover,
      required this.video,
      required this.id});
  House.empty()
      : name = '',
        id = '',
        online = false,
        species = Species.empty(),
        followers = 0,
        cover = '',
        avatar = '',
        story = '',
        video = '',
        num = 0;
  String name;
  int num;
  String story;
  String avatar;
  String cover;
  String video;
  bool online;
  int followers;
  Species species;
  final String id;
}
