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

  var _lineGraph;

  @override
  Widget build(BuildContext context) {
    //collect weight data
    getWeightData();

    _lineGraph = LineGraph.getTimeSeriesChart(_weightData, GraphLineColor.Blue);

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
                    weightInputDialog(context).then((weight) {
                      setState(() {
                        //update current weight
                        _currentWeight = weight;
                        //add entered value to _weightData
                        _weightData.add(new WeightDataObject(weight, new DateTime.now()));
                        //update line graph
                        _lineGraph = LineGraph.getTimeSeriesChart(_weightData, GraphLineColor.Blue);
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
        color: Colors.white,
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
                    UserDataManagement().addWeightEntry(user, double.parse(string));
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
    _weightData
        .add(new WeightDataObject(100, new DateTime(2018, DateTime.april, 10)));
    _weightData
        .add(new WeightDataObject(120, new DateTime(2018, DateTime.april, 11)));
    _weightData
        .add(new WeightDataObject(90, new DateTime(2018, DateTime.april, 12)));
    _weightData
        .add(new WeightDataObject(130, new DateTime(2018, DateTime.april, 13)));

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
