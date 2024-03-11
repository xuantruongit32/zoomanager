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

  Future<void> updateFollowList() async {
    try {
      final userId = getUserId();

      CollectionReference followListRef = FirebaseFirestore.instance.collection('users/$userId/followList');

      QuerySnapshot snapshot = await followListRef.get();
      for (DocumentSnapshot doc in snapshot.docs) {
        await doc.reference.delete();
      }

      for (House house in DataManager.followList) {
        await followListRef.doc(house.id).set({'timestamp': FieldValue.serverTimestamp()});
        print('House with ID ${house.id} added to followList');
      }

      print('All houses added to followList successfully');
    } catch (e) {
      print('Error updating followList: $e');
    }
  }

  Future<void> fetchData() async {
    try {
      final userId = getUserId();

      CollectionReference followListRef = FirebaseFirestore.instance.collection('users/$userId/followList');
      QuerySnapshot querySnapshot = await followListRef.get();
      List<String> houseIds = querySnapshot.docs.map((doc) => doc.id).toList();

      DataManager.followList.clear();

      for (var houseId in houseIds) {
        House? house = DataManager.getHouseById(houseId);
        if (house != null) {
          DataManager.followList.add(house);
        }
      }

      print('Followed houses fetched successfully');
    } catch (e) {
      print('Error fetching followed houses: $e');
    }
  }
}
