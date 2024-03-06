import 'package:zoo/services/models/des_of_house.dart';
import 'package:zoo/services/models/house.dart';

class DataManager {
  static List<House> listHouse = [
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage',
          num: 1,
          species: 'Cottage',
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1000,
    ),
  ];
  static List<House> followList = [];
}
