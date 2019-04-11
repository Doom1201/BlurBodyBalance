import 'package:blurbodybalance/pages/profile.dart';
import 'package:blurbodybalance/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurbodybalance/globals.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  static String tag = 'pagehandler';
  @override
  _PageHandlerState createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
// Holds the index for which tab we are in
  int currentTab = 0;

  // Instantiate these pages to navigate between pages
  Home home;
  Profile profile;
  Settings settings;
  List<Widget> pages;

  Widget curPage;

  @override
  void initState() {
    home = Home();
    profile = Profile();
    settings = Settings();

    pages = [home, profile, settings];
    curPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorHandler().bgDark(),
        body: curPage,
        // Needed to create a new theme for nav bar since there is no variable to change it's color
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: ColorHandler().barDark(),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: ColorHandler().iconDark(),
              currentIndex: currentTab,
              onTap: (int index) {
                setState(() {
                  currentTab = index;
                  curPage = pages[index];
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home',
                      style: TextStyle(color: ColorHandler().iconDark())),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delete),
                  title: Text('Profile',
                      style: TextStyle(color: ColorHandler().iconDark())),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.delete),
                  title: Text('Settings',
                      style: TextStyle(color: ColorHandler().iconDark())),
                )
              ]),
        ));
  }
}
