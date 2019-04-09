import 'package:flutter/material.dart';

// This boolean determines if we want dark mode on or off at startup
bool isDark = false;

// This class handles anything involving colors including darkmode
class ColorHandler {
  // This function handles the dark mode color for
  // Backgrounds
  Color bgDark() {
    Color bgCol;
    if (!isDark) {
      bgCol = Colors.white;
    } else {
      bgCol = Colors.black;
    }
    return bgCol;
  }

  // This function handles the dark mode color for
  // Backgrounds
  Color barDark() {
    Color barCol;
    if (!isDark) {
      barCol = Colors.white;
    } else {
      barCol = Color.fromRGBO(29, 29, 29, 90);
    }
    return barCol;
  }

  // This function handles the dark mode color for
  // Icons and Text
  Color iconDark() {
    Color iconCol;
    if (isDark) {
      iconCol = Colors.white;
    } else {
      iconCol = Colors.black;
    }

    return iconCol;
  }
}
