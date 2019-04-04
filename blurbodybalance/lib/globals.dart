import 'package:flutter/material.dart';

bool isDark;

// This function controls the dark mode functionality
Color dark() {
  Color curCol;
  if (!isDark) {
    curCol = Color.fromRGBO(255, 255, 255, 50);
  } else {
    curCol = Color.fromRGBO(29, 29, 29, 90);
  }
  return curCol;
}
