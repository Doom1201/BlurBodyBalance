import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';

// This currently doesn't remember the state when switching between pages
// Need to fix
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

// MediaQueryData trying to get the length/width correct for
// Multiple devices still needs more functionality/not working yet
class _SettingsState extends State<Settings> {
  MediaQueryData qData;
  double blocksize;
  double blocksizeVert;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {},
        child: Scaffold(
            backgroundColor: ColorHandler().bgDark(),
            appBar: AppBar(
              title: Text('Settings',
                  style: TextStyle(
                      color: ColorHandler().iconDark(),
                      fontWeight: FontWeight.bold)),
              iconTheme: IconThemeData(color: ColorHandler().iconDark()),
              backgroundColor: ColorHandler().barDark(),
            ),
            body: Column(
              children: <Widget>[
                Center(
                  child: ButtonBar(
                    children: <Widget>[
                      Switch(
                        value: drkSwitch,
                        onChanged: (bool e) => darkSwitch(e),
                        activeColor: ColorHandler().iconDark(),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  // This function handles the darkModeSwitch
  void darkSwitch(bool e) {
    setState(() {
      if (e) {
        isDark = true;
        drkSwitch = true;
        e = true;
      } else {
        isDark = false;
        drkSwitch = false;
        e = false;
      }
    });
  }
}
