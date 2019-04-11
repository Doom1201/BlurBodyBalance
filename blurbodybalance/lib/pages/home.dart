import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:blurbodybalance/pages/settings.dart';
import 'package:blurbodybalance/pages/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: ColorHandler().bgDark(),
        ));
  }
}
