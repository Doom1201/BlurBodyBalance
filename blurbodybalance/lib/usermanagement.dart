import 'package:blurbodybalance/pages/weightTracker.dart';
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

  getData(user, field) async {
    try {
      if (field == 'weightData') {
        return await getWeightData(user);
      } else {
        DocumentReference document =
            Firestore.instance.collection('users').document(user.email);
        DocumentSnapshot snapshot = await document.get();
        return snapshot[field];
      }
    } catch (error) {
      print(error);
    }
  }

  updateData(user, field, data) {
    Firestore.instance.collection('users').document(user.email).updateData({
      field: data,
    }).catchError((error) {
      print(error);
    });
  }

  addWeightEntry(user, weight) {
    Firestore.instance.collection('users').document(user.email).updateData({
      'weightData': FieldValue.arrayUnion([
        {'weight': weight, 'timestamp': DateTime.now().toString()}
      ])
    }).catchError((error) {
      print(error);
    });
  }

  getWeightData(user) async {
    try {
      DocumentReference document =
          Firestore.instance.collection('users').document(user.email);
      DocumentSnapshot snapshot = await document.get();
      List<WeightDataObject> weightData = new List<WeightDataObject>();
      snapshot['weightData'].forEach((element) => weightData.add(
          new WeightDataObject(element['weight'].toDouble(),
              DateTime.parse(element['timestamp'].toString()))));
      return weightData;
    } catch (error) {
      print(error);
      return new List<WeightDataObject>();
    }
  }
}
