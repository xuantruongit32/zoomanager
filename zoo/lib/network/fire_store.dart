import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
