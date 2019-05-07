import 'package:blurbodybalance/pages/Setup/signUp.dart';
import 'package:blurbodybalance/pages/Setup/userInfo.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:blurbodybalance/pages/weightTracker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart'; // https://proandroiddev.com/how-to-dynamically-change-the-theme-in-flutter-698bd022d0f0
//import 'package:blurbodybalance/pages/Setup/welcome.dart';
import 'package:blurbodybalance/pages/Setup/pagehandler.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart'; // https://proandroiddev.com/how-to-dynamically-change-the-theme-in-flutter-698bd022d0f0

// Currently can't figure out why runApp new MyApp won't accept
// brightness in order to remember dark state across app restarts
void main() async {
  Brightness brightness;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  brightness = (prefs.getBool("drkSwitch") ?? false)
      ? Brightness.dark
      : Brightness.light;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Home.tag: (context) => Home(),
    //PageHandler.tag: (context) => PageHandler(),
  };
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.dark,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.green,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
              '/signup': (BuildContext context) => new SignUpPage()
            },
            theme: theme,
            home: Home(),
          );
        });
  }
}
