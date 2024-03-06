import 'package:zoo/services/models/des_of_house.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/species.dart';

class DataManager {
  static List<Species> listSpecies = [
    Species(
        name: 'bird1',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original'),
    Species(
        name: 'bird2',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original'),
    Species(
        name: 'bird3',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original'),
    Species(
        name: 'bird4',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original'),
    Species(
        name: 'bird5',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original'),
  ];
  static List<House> listHouse = [
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage1',
          num: 7,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1001,
      species: listSpecies[1],
    ),
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage2',
          num: 1,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1006,
      species: listSpecies[2],
    ),
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage3',
          num: 1,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1000,
      species: listSpecies[4],
    ),
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage4',
          num: 5,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1090,
      species: listSpecies[3],
    ),
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage5',
          num: 3,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1070,
      species: listSpecies[0],
    ),
  ];
  static List<House> followList = [
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage5',
          num: 3,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1070,
      species: listSpecies[0],
    ),
  ];

  static List<House> recommendedList = [
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage4',
          num: 5,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1090,
      species: listSpecies[2],
    ),
    House(
      des: DesOfHouse(
          name: 'Cozy Cottage5',
          num: 3,
          story:
              'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
          avatar:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
          cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg'),
      online: true,
      followers: 1070,
      species: listSpecies[2],
    ),
  ];
}
