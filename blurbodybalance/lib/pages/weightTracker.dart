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

    final lastWeightEntry = Center(
        child: Column(
      children: <Widget>[
        Text("Latest Weight Entry"),
        Text("###.#"),
        RaisedButton(
          child: Text("Enter Weight"),
          elevation: 4.0,
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            inputDialog(context);
          },
        ),
      ],
    ));

    //final goalProgress
    //final weightChart

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        lastWeightEntry,
      ],
    ));
  }

  Future<bool> inputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Text("Enter Weight"),
            children: <Widget>[
              Center(
                child: new TextField(
                  decoration: new InputDecoration(labelText: "Weight"),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  onChanged: (string) {
                    if (string.contains(' ') ||
                        string.contains(',') ||
                        string.contains('-')) {
                      string = string.substring(0, string.length - 1);
                    }
                  },
                  onSubmitted: (string) async {
                    //get user
                    FirebaseUser user =
                        await FirebaseAuth.instance.currentUser();
                    //get entered weight
                    double weight = double.parse(string);
                    //store weight in database
                    UserDataManagement().addWeightEntry(user, weight);
                    //close dialog
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          );
        });
  }

  getWeightData() async {
    UserDataManagement dataManager = new UserDataManagement();
    //get current firebase user
    FirebaseUser user =
        await FirebaseAuth.instance.currentUser().catchError((error) {
      print(error);
    });
    _weightData = await dataManager.getWeightData(user);
  }
}
