import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

bool isDark = true;

// Testing Dark Mode
class DarkMode {
  Color curCol;
  Color dark() {
    if (!isDark) {
      curCol = Color.fromRGBO(255, 255, 255, 50);
    } else {
      curCol = Color.fromRGBO(29, 29, 29, 90);
    }
    return curCol;
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
          backgroundColor: DarkMode().dark(),
        ),
        backgroundColor: DarkMode().dark(),
        body: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Color.fromRGBO(29, 29, 29, 1),
                  onPressed: () => setState(() => isDark = !isDark),
                  child: new Text("Push Me"),
                )
              ],
            )
          ],
        )));
  }
}
