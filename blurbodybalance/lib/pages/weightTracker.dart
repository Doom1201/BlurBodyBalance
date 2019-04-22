import 'package:blurbodybalance/usermanagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/lineGraph.dart';

class WeightTracker extends StatefulWidget {
  @override
  _WeightTrackerState createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  List<WeightDataObject> _weightData = new List<WeightDataObject>();
  double _currentWeight = 0;

  @override
  Widget build(BuildContext context) {
    //collect weight data
    //getWeightData();

    final currentWeightContainer = Center(
        child: Container(
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 200),
            color: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              children: <Widget>[
                Text("Current Weight"),
                Text(_currentWeight.toString()),
                RaisedButton(
                  child: Text("Enter Weight"),
                  elevation: 4.0,
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    inputDialog(context).then((value) {
                      _currentWeight = value;
                    });
                  },
                ),
              ],
            ))));

    //final goalProgress

    final weightChart = Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Chart"),
            Expanded(
              child: LineGraph.getTimeSeriesChart(
                  _createSampleData(), GraphLineColor.Blue),
            )
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[currentWeightContainer, weightChart],
        ));
  }

  Future<double> inputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: new Center(
              child: new Text("Enter Weight"),
            ),
            children: <Widget>[
              Center(
                child: new TextField(
                  decoration: new InputDecoration(labelText: "Weight"),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  onChanged: (string) {
                    //check for illegal characters
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
                    Navigator.of(context).pop(weight);
                  },
                ),
              )
            ],
          );
        });
  }

  /// Create one series with sample hard coded data.
  List<WeightDataObject> _createSampleData() {
    _weightData = new List<WeightDataObject>();
    _weightData
        .add(new WeightDataObject(100, new DateTime(2018, DateTime.april, 10)));
    _weightData
        .add(new WeightDataObject(120, new DateTime(2018, DateTime.april, 11)));
    _weightData
        .add(new WeightDataObject(90, new DateTime(2018, DateTime.april, 12)));
    _weightData
        .add(new WeightDataObject(130, new DateTime(2018, DateTime.april, 13)));

    return _weightData;
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

class WeightDataObject {
  final double weight;
  final DateTime timestamp;

  WeightDataObject(this.weight, this.timestamp);
}
