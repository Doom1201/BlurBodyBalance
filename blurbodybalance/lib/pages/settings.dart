import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

// This currently doesn't remember the state when switching between pages
// Need to fix
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: ColorHandler().bgDark(),
        appBar: AppBar(
          title: Text('Settings',
              style: TextStyle(
                  // color: ColorHandler().iconDark(),
                  fontWeight: FontWeight.bold)),
          // iconTheme: IconThemeData(color: ColorHandler().iconDark()),
          // backgroundColor: ColorHandler().barDark(),
        ),
        body: ButtonBar(
          children: <Widget>[
            Switch(
              value: val,
              onChanged: (bool e) => darkSwitch(e),
              // activeColor: ColorHandler().iconDark(),
            )
          ],
        ));
  }

  // This function handles the darkModeSwitch
  void darkSwitch(bool e) {
    setState(() {
      if (e) {
        isDark = true;
        val = true;
        e = true;
        DynamicTheme.of(context).setBrightness(Brightness.dark);
      } else {
        isDark = false;
        val = false;
        e = false;
        DynamicTheme.of(context).setBrightness(Brightness.light);
      }
    });
  }
}
