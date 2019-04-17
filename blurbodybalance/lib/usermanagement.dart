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
        {'weight': weight, 'timestamp': Timestamp.now()}
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
      List<double> weightData = new List<double>();
      snapshot['weightData']
          .forEach((element) => weightData.add(element['weight'].toDouble()));
      print("data from getdata");
      print(weightData);
      return weightData;
    } catch (error) {
      print(error);
      return new List<double>();
    }
  }
}
