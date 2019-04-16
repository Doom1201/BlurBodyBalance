import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataManagement {
  storeNewUser(user) {
    Firestore.instance.collection('users').document(user.email).setData({
      'email': user.email,
      'uid': user.uid,
      'weightData': []
    }).catchError((e) {
      print(e);
    });
  }

  addWeightEntry(user, weight) {
    Firestore.instance.collection('users').document(user.email).updateData({'weightData':FieldValue.arrayUnion(
      [{
      'weight': weight,
      'timestamp': Timestamp.now()}]
      )});
  }

  getData(user) {
    DocumentSnapshot snapshot;
    Firestore.instance.collection('users').document(user.email).get().then((doc) {
      snapshot = doc;
      print("weightData");
    }).catchError((e) {
      print("ERROR");
      print(e);
    });
    print(snapshot['weightData']);
  }
}