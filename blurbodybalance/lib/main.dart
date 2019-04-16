import 'package:blurbodybalance/pages/Setup/loginPage.dart';
import 'package:blurbodybalance/pages/setup/pagehandler.dart';
import 'package:blurbodybalance/pages/Setup/signUp.dart';
import 'package:blurbodybalance/pages/weightTracker.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignUpPage(),
        'pagehandler': (BuildContext context) => new PageHandler(),
        'weightTracker': (BuildContext context) => new WeightTracker(),
      },

      // Whatever page name you put here will be the default page upon startup

      home: WeightTracker(),
    );
  }
}
