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
        title: Text('My Profile')
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Center(
          child: new Icon(
            Icons.account_circle,
            size: 200.0,
            color: Colors.green[300],
          ),
        ),
        Text("name:", textAlign: TextAlign.center),
        Text("email:", textAlign: TextAlign.center),
        // Text("password:", textAlign: TextAlign.center),
        Text("height:", textAlign: TextAlign.center),
        Text("weight:", textAlign: TextAlign.center),
        // Row(
        //   children: <Widget>[
        //     Expanded(child: Text("asdf", textAlign: TextAlign.left,)),
        //     Expanded(child: Text("asdf", textAlign: TextAlign.right,)),
        //   ],
        // )
      ],
    );
  }
}
