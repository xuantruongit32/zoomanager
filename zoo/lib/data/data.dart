import 'package:zoo/services/models/donate.dart';
import 'package:zoo/services/models/gift.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/species.dart';
import 'package:zoo/services/models/transaction.dart';

class DataManager {
  static House? getHouseById(String id) {
    for (House house in listHouse) {
      if (house.id == id) {
        return house;
      }
    }
    return null;
  }

  static List<House> getHousesBySpecies(String species) {
    List<House> houses = [];

    for (House house in listHouse) {
      if (house.species == species) {
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
        name: 'Bird',
        avatar:
            'https://media.cnn.com/api/v1/images/stellar/prod/231102091639-american-birds-renamed-restricted.jpg?c=original',
        des:
            'Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.'),
    Species(
      name: "Lion",
      avatar: "https://cdn.downtoearth.org.in/library/large/2023-09-18/0.90742900_1695021036_istock-1333977253.jpg",
      des:
          "The lion is a large carnivorous mammal of the Felidae family. Lions are known for their majestic appearance, with a mane of hair around the head of the adult male. They are apex predators, typically found in savanna and grassland habitats, but they can also inhabit forests and deserts. Lions are social animals, living in groups called prides, which typically consist of related females, their offspring, and a small number of adult males. These groups work together to defend their territory, hunt for prey, and raise their young.",
    ),
    Species(
      name: "Elephant",
      avatar: "https://scx2.b-cdn.net/gfx/news/hires/2020/2-africaneleph.jpg",
      des:
          "The elephant is the largest land animal, characterized by its long trunk and tusks. Elephants are herbivores, feeding primarily on grasses, leaves, bark, and fruits. They have a highly developed social structure, living in matriarchal herds led by the oldest and most experienced female, called the matriarch. Elephants communicate through a variety of vocalizations, body language, and tactile signals, displaying complex behaviors such as mourning for their dead and showing empathy towards others. Unfortunately, elephants are facing threats from habitat loss, poaching for their ivory tusks, and human-wildlife conflict.",
    ),
    Species(
      name: "Tiger",
      avatar:
          "https://assets.wwf.org.au/image/upload/c_fill,g_auto,w_1400/f_auto/q_auto/v1/elcom/416/tiger_in_a_river_flickr_pexels?q=75",
      des:
          "The tiger is the largest cat species, recognizable by its pattern of dark vertical stripes on reddish-orange fur. Tigers are solitary hunters, primarily preying on ungulates such as deer and wild boar. They are territorial animals, with each tiger having a home range that it defends against intruders. Tigers are apex predators, playing a crucial role in maintaining the balance of their ecosystems. However, they are endangered due to habitat loss, poaching for their skins and body parts, and conflict with humans. Conservation efforts are underway to protect and preserve tiger populations in the wild.",
    ),
    Species(
      name: "Giraffe",
      avatar:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Giraffe_Mikumi_National_Park.jpg/1200px-Giraffe_Mikumi_National_Park.jpg",
      des:
          "The giraffe is the tallest living terrestrial animal, known for its long neck and distinct spotted pattern. Giraffes are herbivores, feeding on leaves from trees and shrubs. Their long necks enable them to reach high branches that other animals cannot access. Giraffes are social animals, living in loose herds that can vary in size and composition. They have a unique reproductive behavior known as 'necking,' where males engage in neck-to-neck combat to establish dominance and mating rights. Giraffes are found in savannas, grasslands, and open woodlands of Africa.",
    ),
    Species(
      name: "Bear",
      avatar:
          "https://i.natgeofe.com/k/55256f3f-2cf1-4b93-9d95-a13b0faa30a6/Mom-and-Babies_Polar-Bear_KIDS_0223-crop_3x2.jpg",
      des:
          "The polar bear is a carnivorous bear native to the Arctic region, characterized by its thick white fur. Polar bears are superbly adapted to life in the harsh Arctic environment, with a thick layer of blubber for insulation and large, wide paws that help distribute their weight on ice and snow. They are powerful swimmers, capable of covering long distances in search of prey, mainly seals. Climate change poses a significant threat to polar bears, as it leads to the melting of sea ice, reducing their hunting grounds and food sources. Conservation efforts aim to mitigate these threats and protect polar bear populations.",
    ),
  ];
  static List<House> listHouse = [
    House(
      id: '0f5b5a51-ba95-464f-a1c7-dfba41d04043',
      name: 'Avian Haven',
      num: 12,
      story:
          'Avian Haven is a sanctuary for birds of all kinds, from colorful parrots to majestic eagles. Here, injured and orphaned birds receive medical care and rehabilitation, allowing them to soar through the skies once again. Visitors to Avian Haven marvel at the diversity of bird species and learn about the importance of protecting avian habitats.',
      avatar:
          'https://www.barrie.ca/sites/default/files/styles/16_9/public/2023-05/Bird-Friendly-City.jpg?itok=g7kLFo8Q',
      cover: 'https://timelinecovers.pro/facebook-cover/download/forest-birds-in-love-facebook-cover.jpg',
      online: true,
      followers: 1001,
      species: 'Bird',
      video: 'https://assets.mixkit.co/videos/preview/mixkit-macaw-parrot-feeding-on-a-branch-4669-large.mp4',
    ),
    House(
      id: '1e492d90-09e4-4843-ba4d-29848f8043e3',
      name: 'Feather',
      num: 14,
      story:
          'Feathered Friends Haven is a haven for bird enthusiasts, where they can observe and interact with a variety of feathered friends. From tiny hummingbirds to graceful swans, this sanctuary offers a glimpse into the fascinating world of birds. Visitors to Feathered Friends Haven can participate in educational programs and birdwatching tours, fostering a deeper appreciation for avian diversity.',
      avatar: 'https://i.natgeofe.com/k/520e971d-7a22-4a6f-90dc-258df74e45bc/american-goldfinch_2x1.jpg',
      cover: 'https://timelinecovers.pro/facebook-cover/download/birds-on-a-branch-having-fun-facebook-cover.jpg',
      online: true,
      followers: 1701,
      species: 'Bird',
      video:
          'https://media.istockphoto.com/id/1573971440/vi/video/c%E1%BA%ADn-c%E1%BA%A3nh-ch%C3%BA-ch%C3%B3-%C4%91u%C3%B4i-ng%E1%BB%B1a-v%C3%A0ng-%C4%91%E1%BA%A7y-m%C3%A0u-s%E1%BA%AFc-%C4%91%E1%BA%ADu-gi%E1%BB%AFa-b%E1%BB%A5i-li%E1%BB%85u-v%C3%A0-h%C3%A1t-v%C3%A0o-m%E1%BB%99t-bu%E1%BB%95i-t%E1%BB%91i-m%C3%B9a-h%C3%A8.mp4?s=mp4-640x640-is&k=20&c=F3YPnLogqeweVQwLtX6lkNpAxzzH4KOHxg7vk3l420w=',
    ),
    House(
      id: '2d61994b-37cc-41b2-9cb4-285dc3c26bc7',
      name: "Pride Rock",
      online: true,
      followers: 5000,
      species: 'Lion',
      num: 2,
      story:
          "Pride Rock is a sanctuary for lions, where they gather to celebrate the circle of life. It's a place of tradition, where lionesses raise their cubs and where the wisdom of the elders is passed down through generations. The echoing roars of lions can be heard from miles away, signifying the pride's strength and unity.",
      avatar:
          "https://optimise2.assets-servd.host/maniacal-finch/production/animals/african-lion-01-01.jpg?w=1200&h=1200&auto=compress%2Cformat&fit=crop&dm=1658933674&s=2052be1b4ea7fc7a86d7976091b6a06c",
      cover: "https://cms.bbcearth.com/sites/default/files/2020-12/2finx0000001000.jpg",
      video:
          "https://media.istockphoto.com/id/1340462090/video/slow-moiton-close-up-magnificient-male-lion-walking-towards-camera-in-african-savannah.mp4?s=mp4-640x640-is&k=20&c=uCRCUPwC3WFrF32H9mCjDHPeo6BQKJDzFoNrowUxyxA=",
    ),
    House(
      id: '3c9de8e2-13ad-4a9f-a059-8b8fc510cc77',
      name: "Elephant Han",
      online: true,
      followers: 3000,
      species: 'Elephant',
      num: 5,
      story:
          "Elephant Han is a conservation center dedicated to protecting and rehabilitating elephants. Here, rescued elephants find solace and care after facing hardships such as poaching and habitat loss. Visitors to Elephant Haven witness the incredible resilience of these majestic creatures and learn about the importance of their conservation.",
      avatar:
          "https://images.unsplash.com/photo-1557050543-4d5f4e07ef46?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWxlcGhhbnR8ZW58MHx8MHx8fDA%3D",
      cover: "https://i.pinimg.com/originals/03/20/c3/0320c374f373d83d5a8ca07cd760fd19.jpg",
      video:
          "https://media.istockphoto.com/id/1344914411/video/african-bush-elephant-loxodonta-africana-lonely-elephant-walking-in-savannah-of-the-amboseli.mp4?s=mp4-640x640-is&k=20&c=L7-Y7pwRLNW4OBJ5ZV0MtWYveFGGoJD1c88tzK3mlSg=",
    ),
    House(
      id: '4b3b65d9-52a2-4f05-8666-2c9b7771d312',
      name: "Tiger Territory",
      online: false,
      followers: 4500,
      species: 'Tiger',
      num: 1,
      story:
          "Tiger Territory is a reserve dedicated to preserving the habitat of endangered tigers. Here, amidst dense forests and winding rivers, tigers roam freely in their natural environment. Conservationists work tirelessly to protect these magnificent predators from threats such as poaching and habitat destruction.",
      avatar:
          "https://plus.unsplash.com/premium_photo-1664302784209-bb0dea430495?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGlnZXJ8ZW58MHx8MHx8fDA%3D",
      cover: "https://timelinecovers.pro/facebook-cover/download/tiger-hiding-facebook-cover.jpg",
      video:
          "https://cdn.pixabay.com/vimeo/786403437/tiger-145320.mp4?width=640&hash=cbc28d222774e1e78c0c04b517af8d392473f1da",
    ),
    House(
      id: '5a6173c2-91d2-4fc7-9b3a-f9b354f0b4df',
      name: "Giraffe Grove",
      online: true,
      followers: 2500,
      species: 'Giraffe',
      num: 4,
      story:
          "Giraffe Grove is a sanctuary where giraffes roam freely in their natural habitat. Tall acacia trees dot the landscape, providing ample food for these gentle giants. Visitors can observe giraffes as they gracefully move through the savanna, their long necks reaching high into the treetops.",
      avatar:
          "https://images.unsplash.com/photo-1534567110243-8875d64ca8ff?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lyYWZmZXxlbnwwfHwwfHx8MA%3D%3D",
      cover: "https://i.pinimg.com/originals/d7/3a/6c/d73a6c8810cceaa433e43b028e0033b7.jpg",
      video:
          "https://cdn.pixabay.com/vimeo/908857507/giraffe-198781.mp4?width=640&hash=b854ab94c666f4ee8097a3cf08553c4265bd320d",
    ),
    House(
      id: '6d72d4a9-b2e8-44c1-ba64-f47b5df05e03',
      name: "Polar Paradise",
      online: true,
      followers: 4000,
      species: 'Polar Bear',
      num: 2,
      story:
          "Polar Paradise is an Arctic refuge where polar bears can thrive in their icy home. Amidst vast expanses of snow and ice, polar bears hunt seals and raise their young. Researchers stationed here study polar bear behavior and the effects of climate change on their fragile ecosystem.",
      avatar:
          "https://hips.hearstapps.com/hmg-prod/images/bear-1549900314.jpg?crop=0.668xw:1.00xh;0.129xw,0&resize=640:*",
      cover:
          "https://good-nature-blog-uploads.s3.amazonaws.com/uploads/2022/07/Polar-Bear-playing-in-the-snow-by-Eddy-Savage-1280x640.png",
      video:
          "https://cdn.pixabay.com/vimeo/284467858/icebear-17715.mp4?width=1280&hash=8a127c4c9958e74012b0ffad63b1229e7a1ee633",
    ),
    House(
      id: '7f53df1c-793f-48e5-88f6-69b75900e88a',
      name: "Lion's Den",
      online: false,
      followers: 3200,
      species: 'Lion',
      num: 5,
      story:
          "Lion's Den is a community of lions, where they share stories and experiences. It's a place of camaraderie, where young lions playfully spar and older lions impart their wisdom. As night falls, the pride gathers together, basking in the warmth of their companionship.",
      avatar:
          "https://images.unsplash.com/photo-1614027164847-1b28cfe1df60?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGlvbnxlbnwwfHwwfHx8MA%3D%3D",
      cover: "https://colorfully.eu/wp-content/uploads/2013/01/lion-black-facebook-cover.jpg",
      video:
          "https://cdn.pixabay.com/vimeo/700585495/lion-animal-114145.mp4?width=640&hash=cecf9f9a6a0d999d738a125430c7ddca15110ef9",
    ),
    House(
      id: '8e0f5f9c-af1b-4a8d-b8b0-7b8211a1f0a0',
      name: "Elephant San",
      online: true,
      followers: 2800,
      species: 'Elephant',
      num: 4,
      story:
          "Elephant San provides a safe haven for rescued elephants to live peacefully. Here, elephants form bonds with their caretakers and rediscover the joys of freedom. Visitors to the sanctuary witness the deep emotional connections between elephants and the dedicated staff who care for them.",
      avatar:
          "https://images.unsplash.com/photo-1581852017103-68ac65514cf7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZWxlcGhhbnR8ZW58MHx8MHx8fDA%3D",
      cover: "https://africanccf.org/wp-content/uploads/2021/02/elephant_collaring_banner.jpg",
      video:
          "https://cdn.pixabay.com/vimeo/577427903/elephant-81760.mp4?width=1280&hash=ead065152c26a1c392c78dcc2e38442c41496525",
    ),
    House(
      id: '9c83d1a0-5a2e-4999-81b6-b0d76b01186d',
      name: "Tiger Haven",
      online: false,
      followers: 3915,
      species: 'Tiger',
      num: 8,
      story:
          "Tiger Haven is committed to protecting and preserving tiger populations in the wild. Conservationists and researchers work hand in hand to monitor tiger habitats and combat illegal poaching. Through education and advocacy, Tiger Haven aims to ensure a future where tigers can thrive in the wild.",
      avatar:
          "https://images.unsplash.com/photo-1561731216-c3a4d99437d5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGlnZXJ8ZW58MHx8MHx8fDA%3D",
      cover: "https://timelinecovers.pro/facebook-cover/download/tiger-facebook-cover.jpg",
      video:
          "https://cdn.pixabay.com/vimeo/784164228/tiger-143892.mp4?width=1280&hash=a7e397ff42c323fd72b9119829a2d9db630b4331",
    ),
  ];

  static List<House> followList = [];

  static List<Gift> listGift = [
   Gift(name: 'banana', price: 10, avatar: 'https://cdn-icons-png.freepik.com/512/6532/6532383.png'),
    Gift(name: 'apple', price: 20, avatar: 'https://www.iconpacks.net/icons/2/free-apple-icon-3155-thumb.png'),
    Gift(name: 'grapes', price: 20, avatar: 'https://cdn-icons-png.flaticon.com/512/765/765560.png'),
    Gift(name: 'watermelon', price: 25, avatar: 'https://cdn-icons-png.flaticon.com/512/2224/2224321.png'),
    Gift(name: 'steak', price: 35, avatar: 'https://cdn-icons-png.freepik.com/512/3480/3480720.png'),
    Gift(name: 'meat', price: 35, avatar: 'https://cdn-icons-png.freepik.com/512/5222/5222254.png'),
    Gift(name: 'chicken', price: 40, avatar: 'https://cdn-icons-png.flaticon.com/512/3480/3480739.png'),
  ];

  double getTotalTrans() {
    double total = 0;
    for (var tran in trans) {
      total += tran.amount;
    }
    return total;
  }

  double getTotalDonate() {
    double total = 0;
    for (var donate in donateList) {
      total += donate.giftPrice;
    }
    return total;
  }

  List<House> getRecommendList(int num) {
    List<House> list = [];
    List<House> total = listHouse.toList();
    total.removeWhere(
      (element) => followList.contains(element),
    );
    total.sort(
      (a, b) => b.followers!.compareTo(a.followers!),
    );
    list = total.sublist(0, num);
    return list;
  }

  static double money = 0;
  static List<Trans> trans = [];
  static List<Donate> donateList = [];
}
