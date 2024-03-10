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

  Future<void> addFollowHouseToFireStore(String id) async {
    final userId = getUserId();
    CollectionReference collection = FirebaseFirestore.instance.collection('users/$userId/followList');
    await collection.add(id);
  }

  Future<void> updateFollowList() async {
    try {
      final userId = getUserId();

      CollectionReference followListRef = FirebaseFirestore.instance.collection('users/$userId/followList');

      for (House house in DataManager.followList) {
        await followListRef.doc(house.id).set({'timestamp': FieldValue.serverTimestamp()});
        print('House with ID ${house.id} added to followList');
      }

      print('All houses added to followList successfully');
    } catch (e) {
      print('Error adding houses to followList: $e');
    }
  }
}
