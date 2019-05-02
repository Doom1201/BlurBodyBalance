import 'package:blurbodybalance/databasemanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'dart:async';
import 'dart:math';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:blurbodybalance/globals.dart';

class Home extends StatefulWidget {
  static String tag = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static String muestrePasos = "";
  String _km = "Unknown";
  String _calories = "Unknown";

  String _stepCountValue = 'Unknown';
  StreamSubscription<int> _subscription;

  double _numSteps = 0;
  double _convert;
  double _kmx;
  double burnedx;
  double _percentage;

  @override
  void initState() {
    super.initState();
    //initPlatformState();
    setUpPedometer();
    setUpNotifications();
  }

  //inicia codigo pedometer
  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  //Setup for notifications
  void setUpNotifications() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings(onDidReceiveLocalNotification: onDidRecieveLocalNotification);
    var initSettings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(context: context, builder: (_)=> new AlertDialog(
      title: new Text('Blur Body Balance'),
      content: new Text('$payload')
    ));
  }

  void _onData(int stepCountValue) async {
    // print(stepCountValue); //impresion numero pasos por consola
    setState(() {
      _stepCountValue = "$stepCountValue";
    });

    var dist = stepCountValue;
    double y = (dist + .0); // Convert to double

    setState(() {
      _numSteps = y; // Change to double
    });

    getDistanceRun(_numSteps);
  }

  void reset() {
    setState(() {
      int stepCountValue = 0;
      stepCountValue = 0;
      _stepCountValue = "$stepCountValue";
    });
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  //function to determine the distance run in kilometers using number of steps
  void getDistanceRun(double _numSteps) {
    var distance = ((_numSteps * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); // Two decimal places
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));

    setState(() {
      _km = "$distance";
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  //function to determine the calories burned in kilometers using number of steps
  void getBurnedRun() {
    setState(() {
      var calories = _kmx; //dos decimales
      _calories = "$calories";
    });
  }

  @override
  Widget build(BuildContext context) {
    getBurnedRun();
    return Container(
        padding: EdgeInsets.fromLTRB(110, 30, 0, 0),
        width: 250,
        height: 250,
        child: new CircularPercentIndicator(
          progressColor: Colors.green,
          radius: 200.0,
          lineWidth: 13.0,
          animateFromLastPercent: true,
          animation: true,
          center: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(7, 80.0, 0.0, 0.0),
                        child: Text('$_stepCountValue',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 132, 0, 0),
                        child: Text(
                          '/ 6000 steps',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
          percent: _numSteps / 6000,
        ));
    //return WillPopScope(onWillPop: () async => false, child: Scaffold());
  }

  //chooses and sends a notification (50% generic, 50% key specified)
  String getNotification() {
      String trueKey;
      var rng = new Random();
      int no1= rng.nextInt(2);
      if (no1 == 0) {         // if generic chosen
        if ((skipped3Days || behindRunGoal || missedCalGoal) && meanMsg)   //if behind in any aspect and mean messages turned on
          trueKey = 'badGen';
        else
          trueKey = 'goodGen';
      }
      else {                  //if non-generic chosen
        int no2 = rng.nextInt(2);
        if (no2 == 0) {       //if run focus chosen
          if (behindRunGoal && meanMsg) {
            trueKey = 'badUnderRunG';
          } else {
            trueKey = 'goodOverRunG';
          }
        } else {              //if calorie focus chosen
          if (missedCalGoal && meanMsg) {
            trueKey = 'badOverC';
          } else trueKey = 'goodUnderC';
        }
      }
      //key is now set.
      return getMessage(trueKey);
  }

  Future<void> _showDailyAtTime(String key) async {
    var time = Time(10, 0, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'BlurBodyBalance',
        'Blur Body Balance',
        key);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(0,
        'Blur Body Balance', getNotification(), time, platformChannelSpecifics);
  }

  Future<void> onDidRecieveLocalNotification(
      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    await showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
}
