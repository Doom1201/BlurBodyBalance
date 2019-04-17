import 'package:blurbodybalance/usermanagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
