import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHandler().bgDark(),
      appBar: AppBar(
        title: Text('My Profile',
            style: TextStyle(
                color: ColorHandler().iconDark(), fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: ColorHandler().iconDark()),
        backgroundColor: ColorHandler().barDark(),
      ),
    );
  }
}
