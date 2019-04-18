import 'package:blurbodybalance/usermanagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WeightTracker extends StatefulWidget {
  @override
  _WeightTrackerState createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  List<weightDataObject> _weightData = new List<weightDataObject>();

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
              child: charts.TimeSeriesChart(
                _createSampleData(),
                animate: true,
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            currentWeightContainer,
            weightChart
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

  /// Create one series with sample hard coded data.
  List<charts.Series<weightDataObject, DateTime>> _createSampleData() {
    _weightData = new List<weightDataObject>();
    _weightData
        .add(new weightDataObject(100, new DateTime(2018, DateTime.april, 10)));
    _weightData
        .add(new weightDataObject(120, new DateTime(2018, DateTime.april, 11)));
    _weightData
        .add(new weightDataObject(90, new DateTime(2018, DateTime.april, 12)));
    _weightData
        .add(new weightDataObject(130, new DateTime(2018, DateTime.april, 13)));

    return [
      new charts.Series<weightDataObject, DateTime>(
        id: 'weight',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (weightDataObject weight, _) => weight.timestamp,
        measureFn: (weightDataObject weight, _) => weight.weight,
        data: _weightData,
      )
    ];
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

class weightDataObject {
  final double weight;
  final DateTime timestamp;

  weightDataObject(this.weight, this.timestamp);
}
