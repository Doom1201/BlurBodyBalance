import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:pedometer/pedometer.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
        ),
      ),
    );
  }
}
