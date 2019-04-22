import 'package:flutter/material.dart';

Brightness brightness;

// This boolean determines if we want dark mode on or off at startup
bool isDark = false;

// Switches
bool drkSwitch = false;
bool distSwitch = false;

// User Info
String age;
String weight;
String height;
String gender;

// Other
double globStep;

// Units
double distUnit;

double calcdistUnit() {
  if (distSwitch) {
    distUnit = 1;
  } else {
    distUnit = 1.609;
  }
  return distUnit;
}
