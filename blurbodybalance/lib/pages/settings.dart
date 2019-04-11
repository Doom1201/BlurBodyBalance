import 'package:flutter/material.dart';
import 'package:blurbodybalance/globals.dart';

// This currently doesn't remember the state when switching between pages
// Need to fix
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MediaQueryData qData;
  bool val = false;
  double blocksize;
  double blocksizeVert;
  @override
  Widget build(BuildContext context) {
    qData = MediaQuery.of(context);
    blocksize = qData.size.width / 100;
    blocksizeVert = qData.size.height / 100;
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
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
            body: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red),
                        child:
                            Container(height: blocksizeVert, width: blocksize)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Center(
                      child: ButtonBar(
                        children: <Widget>[
                          Switch(
                            value: val,
                            onChanged: (bool e) => darkSwitch(e),
                            activeColor: ColorHandler().iconDark(),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )));
  }

  // This function handles the darkModeSwitch
  void darkSwitch(bool e) {
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
