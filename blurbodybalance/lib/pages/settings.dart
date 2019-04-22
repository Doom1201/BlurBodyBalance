import 'package:dynamic_theme/dynamic_theme.dart';
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
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: ButtonBar(
                children: <Widget>[
                  Switch(
                    value: drkSwitch,
                    onChanged: (bool e) => darkSwitch(e),
                    //activeColor: ColorHandler().iconDark(),
                  ),
                ],
              ),
            ),
            Center(
              child: ButtonBar(
                children: <Widget>[
                  Switch(
                    value: distSwitch,
                    onChanged: (bool e) => unitSwitch(e),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  // This function handles the darkModeSwitch
  void darkSwitch(bool e) {
    setState(() {
      if (e) {
        drkSwitch = true;
        DynamicTheme.of(context).setBrightness(Brightness.dark);
        e = true;
      } else {
        drkSwitch = false;
        DynamicTheme.of(context).setBrightness(Brightness.light);
        e = false;
      }
    });
  }

  void unitSwitch(bool e) {
    setState(() {
      if (e) {
        distSwitch = true;
        e = true;
      } else {
        drkSwitch = false;
        e = false;
      }
    });
  }
}
