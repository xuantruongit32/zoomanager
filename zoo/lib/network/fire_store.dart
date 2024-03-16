import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:zoo/data/data.dart';
import 'package:zoo/services/models/donate.dart';
import 'package:zoo/services/models/house.dart';
import 'package:zoo/services/models/transaction.dart';

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
      CollectionReference collection = FirebaseFirestore.instance.collection('users/$userId/data');
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
      DataManager.trans.clear();
      DocumentSnapshot<Map<String, dynamic>> snapshot2 =
          await FirebaseFirestore.instance.collection('users/$userId/data').doc('trans').get();
      Map<String, dynamic>? data = snapshot2.data();

      if (data != null) {
        for (var d in data.entries) {
          double amount = double.parse(d.value.toString());
          DateTime date = DateTime.parse(d.key);
          DataManager.trans.add(
            Trans(
              date: date,
              amount: amount,
            ),
          );
        }
      }
      DataManager.donateList.clear();
      QuerySnapshot<Map<String, dynamic>> snapshot3 =
          await FirebaseFirestore.instance.collection('users/$userId/donate').get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> document in snapshot3.docs) {
        Map<String, dynamic> data = document.data();
        DateTime date = DateTime.parse(data['date']);
        House who = DataManager.getHouseById(data['who']);
        Donate donate = Donate(
          date: date,
          beforeMoney: data['beforeMoney'],
          giftPrice: data['giftPrice'],
          giftName: data['giftName'],
          afterMoney: data['afterMoney'],
          who: who,
        );
        DataManager.donateList.add(donate);
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

  Future<void> addTransactionToFireStore(Trans tran) async {
    final userId = getUserId();

    CollectionReference transactionsCollection = FirebaseFirestore.instance.collection('users/$userId/data');
    await transactionsCollection.doc('trans').set(
      {
        tran.date.toString(): tran.amount,
      },
      SetOptions(merge: true),
    );
    CollectionReference collection2 = FirebaseFirestore.instance.collection('money/data/trans');
    DateTime now = DateTime.now();
    String mess = userId.toString() + " " + tran.amount.toStringAsFixed(2);
    await collection2.doc('total').set(
      {now.toString(): mess},
      SetOptions(merge: true),
    );
  }

  Future<void> addDonateToFireStore(Donate donate) async {
    final userId = getUserId();
    CollectionReference collection = FirebaseFirestore.instance.collection('users/$userId/donate');
    await collection.doc(donate.id).set({
      'date': donate.date.toString(),
      'afterMoney': donate.afterMoney,
      'beforeMoney': donate.beforeMoney,
      'id': donate.id,
      'giftName': donate.giftName,
      'giftPrice': donate.giftPrice,
      'who': donate.who.id,
    });
    CollectionReference collection2 = FirebaseFirestore.instance.collection('money/data/donate');
    DateTime now = DateTime.now();
    String mess =
        userId.toString() + "_" + donate.giftPrice.toStringAsFixed(2) + "_" + donate.who.name + "_" + donate.who.id;
    await collection2.doc('total').set(
      {now.toString(): mess},
      SetOptions(merge: true),
    );
    String mess2 = userId.toString() + "_" + donate.giftPrice.toStringAsFixed(2);
    await collection2.doc(donate.who.id).set(
      {now.toString(): mess2},
      SetOptions(merge: true),
    );
  }
}
