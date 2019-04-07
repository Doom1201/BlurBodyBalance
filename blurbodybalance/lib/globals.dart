import 'package:flutter/material.dart';
import 'dart:math';

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

//Insult bank (REMEMBER, GO FOR FUNNY NOT MEAN, ESPECIALLY FOR WEIGHT) 
List<String> badGeneric = new List<String>();// List of generic insults for goals not met.
List<String> badOverCal = new List<String>();  //insults for going over calorie limit
List<String> badUnderRunGoal = new List<String>(); //insults for not making run goal for the week



//This function returns a random insult of the specified category
String getMessage(String cat) {
  var rng;                               //random number generator
  badGeneric.add('Oh, there you are. Try to do something productive while youre here.');
  badGeneric.add('Oh hey. Need a hand to put yourself back on the bandwagon?');
  badGeneric.add('Huh, is it New Years already? Because I haven\'t seen any resolutions for a while.');

  badOverCal.add('Welcome back. Put down the sandwich, we have work to do.');
  badOverCal.add('Welcome back. Put down the cup of whipped cream you call coffee, we have work to do.');

  badUnderRunGoal.add('Are you jogging? No? Then get to it!');
  badUnderRunGoal.add('I don\'t see legs moving!');
  switch (cat) {
    case 'badGen':
      rng = new Random();
      int i = rng.nextInt();
      return badGeneric[i];
    case 'badOverC':
      rng = new Random();
      int i = rng.nextInt();
      return badOverCal[i];
    case 'badUnderRunG':
      rng = new Random();
      int i = rng.nextInt();
      return badUnderRunGoal[i];
    default:
      throw Exception('Improper category given');
  }
}
