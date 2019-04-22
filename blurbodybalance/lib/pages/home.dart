import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => false, child: buildPage());
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: buildCharts(),
      // body: buildLinearPercentIndicators(),
    );
  }

  // makes 2 graphics for steps and progress (currently) using the percent_indicator package
  Widget buildCharts() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 10.0,
              percent: 0.8,     // can replace this with a variable
              header: new Text("steps"),
              center: new Icon(
                Icons.directions_walk,
                size: 100.0,
                color: Colors.green[300],           // replace with theme
              ),
              backgroundColor: Colors.grey,   // replace with theme
              progressColor: Colors.green[300],     // replace with theme
              animation: true,
              animationDuration: 1000,     // replace with variable based on percent
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("weight loss progress or something"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  lineHeight: 20.0,
                  percent: 0.5,   // replace with a variable
                  center: Text(
                    "50.0%",      // replace with a variable
                    style: new TextStyle(fontSize: 12.0),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  backgroundColor: Colors.grey,   // replace with theme
                  progressColor: Colors.green[300],     // replace with theme
                  animation: true,
                  animationDuration: 500,   // replace with variable based on percent
                ),
              ),
            ]
          ),
        ]
      )
    );
  }

  // the examples for linear percent indicators from the package
  Widget buildLinearPercentIndicators() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: 140.0,
              lineHeight: 14.0,
              percent: 0.5,
              center: Text(
                "50.0%",
                style: new TextStyle(fontSize: 12.0),
              ),
              trailing: Icon(Icons.mood),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: 170.0,
              animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              leading: new Text("left content"),
              trailing: new Text("right content"),
              percent: 0.2,
              center: Text("20.0%"),
              linearStrokeCap: LinearStrokeCap.butt,
              progressColor: Colors.red,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 0.9,
              center: Text("90.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.greenAccent,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 50,
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2500,
              percent: 0.8,
              center: Text("80.0%"),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.green,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                new LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.2,
                  progressColor: Colors.red,
                ),
                new LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.5,
                  progressColor: Colors.orange,
                ),
                new LinearPercentIndicator(
                  width: 100.0,
                  lineHeight: 8.0,
                  percent: 0.9,
                  progressColor: Colors.blue,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
