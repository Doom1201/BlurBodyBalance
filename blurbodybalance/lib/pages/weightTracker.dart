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
  List<double> _weightData = new List<double>();

  @override
  Widget build(BuildContext context) {
    //collect weight data
    getWeightData();

    final lastWeightEntry = Text("Weight Tracker");
    
    //final goalProgress
    //final weightChart

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            lastWeightEntry,
            //GoalProgress,
            //WeightChart,
          ],
        )
      ),
    );
  }

  getWeightData() async {
    UserDataManagement dataManager = new UserDataManagement();
    //get current firebase user
    FirebaseUser user = await FirebaseAuth.instance.currentUser().catchError((error) {
      print(error);
    });
    _weightData = await dataManager.getWeightData(user);
  }
}