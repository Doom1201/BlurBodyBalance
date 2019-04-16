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

  getWeightData(user) async {
    DocumentReference document = Firestore.instance.collection('users').document(user.email);
    DocumentSnapshot snapshot = await document.get();

    List<double> weightData = new List<double>();
    snapshot['weightData'].forEach((element) => weightData.add(element['weight'].toDouble()));
    print("data from getdata");
    print(weightData);
    return weightData;
  }
}