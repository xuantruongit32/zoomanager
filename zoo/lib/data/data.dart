import 'package:zoo/services/models/gift.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/species.dart';
import 'package:zoo/services/models/transaction.dart';

class DataManager {
  static House getHouseById(String id) {
    for (House house in listHouse) {
      if (house.id == id) {
        return house;
      }
    }
    return House.empty();
  }

  static List<House> getHousesBySpeciesId(String speciesId) {
    List<House> houses = [];

    for (House house in listHouse) {
      if (house.species.id == speciesId) {
        houses.add(house);
      }
    }
    return houses;
  }

  static bool checkHouseInListFollow(String id) {
    for (House house in followList) {
      if (house.id == id) {
        return true;
      }
    }
    return false;
  }

  static List<Species> listSpecies = [
    Species(
        name: 'bird2',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird4',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird5',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird6',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird7',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird8',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
        name: 'bird10',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
  ];
  static List<House> listHouse = [
    House.old(
      id: '0f5b5a51-ba95-464f-a1c7-dfba41d04043',
      name: 'Cozy Cottage1',
      num: 7,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1001,
      species: listSpecies[1],
      video: 'https://assets.mixkit.co/videos/preview/mixkit-macaw-parrot-feeding-on-a-branch-4669-large.mp4',
    ),
    House.old(
      id: '1e492d90-09e4-4843-ba4d-29848f8043e3',
      name: 'Cozy Cottage2',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '2d61994b-37cc-41b2-9cb4-285dc3c26bc7',
      name: 'Cozy Cottage3',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '3c9de8e2-13ad-4a9f-a059-8b8fc510cc77',
      name: 'Cozy Cottage4',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '4b3b65d9-52a2-4f05-8666-2c9b7771d312',
      name: 'Cozy Cottage5',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '5a6173c2-91d2-4fc7-9b3a-f9b354f0b4df',
      name: 'Cozy Cottage6',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '6d72d4a9-b2e8-44c1-ba64-f47b5df05e03',
      name: 'Cozy Cottage7',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '7f53df1c-793f-48e5-88f6-69b75900e88a',
      name: 'Cozy Cottage8',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '8e0f5f9c-af1b-4a8d-b8b0-7b8211a1f0a0',
      name: 'Cozy Cottage9',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House.old(
      id: '9c83d1a0-5a2e-4999-81b6-b0d76b01186d',
      name: 'Cozy Cottage10',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: false,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
  ];

  static List<House> recommendedList = [
    House(
      name: 'Cozy Cottage1',
      num: 7,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1001,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House(
      name: 'Cozy Cottage2',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House(
      name: 'Cozy Cottage3',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House(
      name: 'Cozy Cottage4',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: false,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House(
      name: 'Cozy Cottage5',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: false,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
    House(
      name: 'Cozy Cottage6',
      num: 5,
      story:
          'A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.A quaint little cottage nestled in the woods.',
      avatar:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg',
      cover: 'https://i.pinimg.com/originals/ac/bf/99/acbf998a4203718de402e571fb106775.jpg',
      online: true,
      followers: 1701,
      species: listSpecies[1],
      video: 'https://www.youtube.com/watch?v=-IlG32Pb43g',
    ),
  ];
  static List<House> followList = [];

  static List<Gift> listGift = [
    Gift(
        name: 'banana',
        price: 10,
        avatar: 'https://uxwing.com/wp-content/themes/uxwing/download/fruits-vegetables/banana-icon.png'),
    Gift(
        name: 'banana1',
        price: 12,
        avatar: 'https://uxwing.com/wp-content/themes/uxwing/download/fruits-vegetables/banana-icon.png'),
    Gift(
        name: 'banana2',
        price: 17,
        avatar: 'https://uxwing.com/wp-content/themes/uxwing/download/fruits-vegetables/banana-icon.png'),
    Gift(
        name: 'banana3',
        price: 18,
        avatar: 'https://uxwing.com/wp-content/themes/uxwing/download/fruits-vegetables/banana-icon.png'),
    Gift(
        name: 'banana4',
        price: 15,
        avatar: 'https://www.inventicons.com/uploads/iconset/537/wm/512/Banana_Peeled-38.png'),
  ];

  double getTotalTrans() {
    double total = 0;
    for (var tran in trans) {
      total += tran.amount;
    }
    return total;
  }

  static double money = 0;
  static List<Trans> trans = [];
}
