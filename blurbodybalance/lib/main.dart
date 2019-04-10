import 'package:blurbodybalance/pages/home.dart';
import 'package:blurbodybalance/pages/Setup/graphTest.dart';
import 'package:blurbodybalance/pages/Setup/signUp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new SignUpPage()
      },
      home: Graph(),
    );
  }
}
