import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';

// This currently doesn't remember the state when switching between pages
// Need to fix
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool val = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHandler().bgDark(),
        appBar: AppBar(
          title: Text('Settings',
              style: TextStyle(
                  color: ColorHandler().iconDark(),
                  fontWeight: FontWeight.bold)),
          iconTheme: IconThemeData(color: ColorHandler().iconDark()),
          backgroundColor: ColorHandler().barDark(),
        ),
        body: ButtonBar(
          children: <Widget>[
            Switch(
              value: val,
              onChanged: (bool e) => mySwitch(e),
              activeColor: ColorHandler().iconDark(),
            )
          ],
        ));
  }

  void mySwitch(bool e) {
    setState(() {
      if (e) {
        isDark = true;
        val = true;
        e = true;
      } else {
        isDark = false;
        val = false;
        e = false;
      }
    });
  }
}
