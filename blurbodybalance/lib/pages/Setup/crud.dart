import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CrudMethods {
  int value = 0;
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(userData) async {
    if (isLoggedIn()) {
      Firestore.instance.runTransaction((Transaction crudTransaction) async {
        CollectionReference reference =
            await Firestore.instance.collection('users');

        reference.add(userData);
      });
    } else {
      print('You need to be logged in');
    }
  }

  getData() async {
    return await Firestore.instance.collection('users').snapshots();
  }

  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('users')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteData(docID) {
    Firestore.instance
        .collection('users')
        .document(docID)
        .delete()
        .catchError((e) {
      print(e);
    });
  }
}
