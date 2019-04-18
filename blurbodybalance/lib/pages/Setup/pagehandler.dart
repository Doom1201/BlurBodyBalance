import 'package:flutter/material.dart';
import 'package:blurbodybalance/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:blurbodybalance/pages/settings.dart';

class PageHandler extends StatefulWidget {
  const PageHandler({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _PageHandlerState createState() => _PageHandlerState();
}

class _PageHandlerState extends State<PageHandler> {
// Holds the index for which tab we are in
  int currentTab = 0;

  // Instantiate these pages to navigate between pages
  Home home;
  // This is temporary until more pages can be navigated to from the nav bar
  Settings placeholder;
  List<Widget> pages;

  Widget curPage;

  @override
  void initState() {
    home = Home();
    placeholder = Settings();

    pages = [home, placeholder];
    curPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorHandler().bgDark(),
      body: curPage,
      // Needed to create a new theme for nav bar since there is no variable to change it's color
      bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // fixedColor: ColorHandler().iconDark(),
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
                title: Text('Home'),
                    // style: TextStyle(color: ColorHandler().iconDark())),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete),
                title: Text('PH'),
                    // style: TextStyle(color: ColorHandler().iconDark())),
              ),
            ]),
    );
  }
}
