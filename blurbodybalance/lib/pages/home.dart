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
    return Scaffold(
      // backgroundColor: ColorHandler().bgDark(),
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Removes back button so user can't go directly back to login screen have to signout to get there
        // backgroundColor: ColorHandler().barDark(),
        actions: <Widget>[
          // Menu button which brings us to the settings page as of now
          IconButton(
              icon: Icon(
                Icons.face,
                // color: ColorHandler().iconDark(),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              }),
          IconButton(
              icon: Icon(
                Icons.menu,
                // color: ColorHandler().iconDark(),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              })
        ],
      ),
    );
  }
}
