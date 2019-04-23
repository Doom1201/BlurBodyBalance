import 'package:blurbodybalance/databasemanager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/lineGraph.dart';

class WeightTracker extends StatefulWidget {
  @override
  _WeightTrackerState createState() => _WeightTrackerState();
}

class _WeightTrackerState extends State<WeightTracker> {
  List<WeightDataObject> _weightData = new List<WeightDataObject>();
  double _currentWeight;
  var _lineGraph;

  @override
  void initState() {
    super.initState();

    getWeightData();
    _currentWeight = _weightData[_weightData.length - 1].weight;
    _lineGraph =
        LineGraph.getTimeSeriesChart(_weightData, GraphLineColor.LightGreen);
    print(_currentWeight);
  }

  @override
  Widget build(BuildContext context) {
    final currentWeightContainer = Center(
        child: Container(
            constraints: BoxConstraints(maxHeight: 100, maxWidth: 200),
            color: Colors.black,
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              children: <Widget>[
                Text("Current Weight"),
                Text(_currentWeight.toString()),
                RaisedButton(
                  child: Text("Enter Weight"),
                  elevation: 4.0,
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  onPressed: () {
                    weightInputDialog(context).then((weight) {
                      setState(() {
                        //update current weight
                        _currentWeight = weight;
                        //add entered value to _weightData
                        _weightData.add(
                            new WeightDataObject(weight, new DateTime.now()));
                        //update line graph
                        _lineGraph = LineGraph.getTimeSeriesChart(
                            _weightData, GraphLineColor.LightGreen);
                        print(_weightData[_weightData.length - 1].weight);
                      });
                    });
                  },
                ),
              ],
            ))));

    //graph
    final weightGraphContainer = Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
        color: Colors.black,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text("Chart"),
            Expanded(
              child: _lineGraph,
            )
          ],
        ),
      ),
    );

    //main page
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[currentWeightContainer, weightGraphContainer],
        ));
  }

  Future<double> weightInputDialog(BuildContext context) {
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

                    double weight = double.parse(string);

                    //store weight in database
                    DatabaseManager()
                        .addWeightEntry(user, double.parse(string));
                    //close dialog
                    Navigator.of(context).pop(weight);
                  },
                ),
              )
            ],
          );
        });
  }

  getWeightData() async {
    _weightData = new List<WeightDataObject>();

    var values = [
      180.0,
      182.0,
      182.0,
      183.0,
      188.0,
      190.0,
      187.0,
      189.0,
      190.0,
      195.0,
      200.0
    ];

    for (int i = 0; i < values.length; ++i) {
      _weightData.add(new WeightDataObject(
          values[i], new DateTime(2018, DateTime.april, 12 + i)));
    }

    // UserDataManagement dataManager = new UserDataManagement();
    // //get current firebase user
    // FirebaseUser user =
    //     await FirebaseAuth.instance.currentUser().catchError((error) {
    //   print(error);
    // });
    // _weightData = await dataManager.getWeightData(user);
  }
}

class WeightDataObject {
  final double weight;
  final DateTime timestamp;

  WeightDataObject(this.weight, this.timestamp);
}
