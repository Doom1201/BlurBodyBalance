import 'package:blurbodybalance/usermanagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';

class WeightTracker extends StatefulWidget {
  @override
  _WeightTrackerState createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  List<double> _weightData;
  @override
  Widget build(BuildContext context) {
    getWeightData();
    return Scaffold(
      body: Center(
        child: Text("Weight Tracker"),
      ),
    );
  }

  getWeightData() async {
    UserDataManagement dataManager = new UserDataManagement();
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var weightData = await dataManager.getWeightData(user);
    _weightData = weightData[0];
  }
}