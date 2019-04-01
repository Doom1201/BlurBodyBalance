import 'package:blurbodybalance/pages/Setup/userInfo.dart';
import 'package:blurbodybalance/pages/Setup/welcome.dart';
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
      home: UserrInfo(),
      //github test
    );
  }
}
