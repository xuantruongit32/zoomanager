import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/house.dart';

class FireStore {
  String? getUserId() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  Future<void> addFollowedHouseToFireStore(House house) async {
    try {
      final userId = getUserId();
      CollectionReference collection = FirebaseFirestore.instance.collection('users/$userId/data');

      await collection.doc('followList').set(
        {
          house.id: house.name,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print('Error updating followList: $e');
    }
  }

  Future<void> removeFollowedHouseFromFireStore(House house) async {
    try {
      final userId = getUserId();
      CollectionReference collection = FirebaseFirestore.instance.collection('user/$userId/data');
      await collection.doc('followList').update({
        house.id: FieldValue.delete(),
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> fetchData() async {
    try {
      final userId = getUserId();
      DataManager.followList.clear();
      DataManager.money = 0;

      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('users/$userId/data').doc('followList').get();

      Map<String, dynamic>? followList = snapshot.data();

      if (followList != null) {
        for (var data in followList.entries) {
          var id = data.key;
          House house = DataManager.getHouseById(id);
          print("HHHEHEHEHHEH ${house.id}");

          DataManager.followList.add(house);
        }
      }
      DocumentSnapshot<Map<String, dynamic>> snapshot1 =
          await FirebaseFirestore.instance.collection('users/$userId/data').doc('money').get();
      if (snapshot1.exists && snapshot1.data() != null) {
        if (snapshot1.data()!.containsKey('money')) {
          DataManager.money = snapshot1.data()!['money'];
        }
      }
    } catch (e) {
      print('Error fetching followed houses: $e');
    }
  }

  Future<void> updateMoney() async {
    final userId = getUserId();

    try {
      CollectionReference collection = FirebaseFirestore.instance.collection('users/$userId/data');
      await collection.doc('money').set({
        'money': DataManager.money,
      });
    } catch (e) {
      print("Error: $e");
    }
  }
}
