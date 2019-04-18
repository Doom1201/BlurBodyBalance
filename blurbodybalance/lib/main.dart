import 'package:blurbodybalance/pages/Setup/signUp.dart';
import 'package:blurbodybalance/pages/Setup/welcome.dart';
import 'package:blurbodybalance/pages/Setup/pagehandler.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';    // https://proandroiddev.com/how-to-dynamically-change-the-theme-in-flutter-698bd022d0f0

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
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

          home: PageHandler(),
        );
      }
    );
  }
}
