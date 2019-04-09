import 'package:flutter/material.dart';
import 'dart:math';

bool isDark;
bool meanMsg; // T = ON, F = OFF


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

//This function returns a random comment of the specified category
String getMessage(String cat) {

//Comment bank (REMEMBER, GO FOR FUNNY NOT MEAN, ESPECIALLY FOR WEIGHT)
  List<String> badGeneric = new List<String>();       // List of generic insults for goals not met.
  List<String> badOverCal = new List<String>();       // insults for going over calorie limit
  List<String> badUnderRunGoal = new List<String>();  //insults for not making run goal for the week
  List<String> goodGeneric = new List<String>();      // List of positive generic comments
  List<String> goodUnderCal = new List<String>();     //List of positive calorie comments
  List<String> goodOverRunGoal = new List<String>();  //List of positive run comments

  badGeneric.add('Oh, there you are. Try to do something productive while youre here.');
  badGeneric.add('Oh hey. Need a hand to put yourself back on the bandwagon?');
  badGeneric.add('Huh, is it New Years already? Because I haven\'t seen any resolutions for a while.');

  badOverCal.add('Welcome back. Put down the sandwich, we have work to do.');
  badOverCal.add('Welcome back. Put down the cup of whipped cream you call coffee, we have work to do.');

  badUnderRunGoal.add('Are you jogging? No? Then get to it!');
  badUnderRunGoal.add('C\'mon, buddy! I don\'t see legs moving!');

  goodGeneric.add('Hey there! Let\'s get started, shall we?');
  goodGeneric.add('Welcome back! Ready to begin?');
  goodGeneric.add('Good to see you again! Now, let\'s get down to business!');
  goodGeneric.add('Hello again! You\'re doing good so far, let\'s keep it going!');

  goodUnderCal.add('You\'ve got this. Grab a (healthy) bagel and let\'s do this!');
  goodUnderCal.add('You\'re doing great so far. Remember: The less cals you have now, the bigger your dessert!');

  goodOverRunGoal.add('Holy footprints that\'s a lotta steps! Keep it up!');
  goodOverRunGoal.add('Phew, slow down! I need to keep up!');

  //Depending on which case is passed, the corresponding category is looked at
  switch (cat) {
    case 'badGen':
      if (!meanMsg) throw Exception('Mean messages are turned off.');
      return msgHelp(badGeneric);
    case 'badOverC':
      if (!meanMsg) throw Exception('Mean messages are turned off.');
      return msgHelp(badOverCal);
    case 'badUnderRunG':
      if (!meanMsg) throw Exception('Mean messages are turned off.');
      return msgHelp(badUnderRunGoal);
    case 'goodGen':
      return msgHelp(goodGeneric);
    case 'goodUnderC':
      return msgHelp(goodUnderCal);
    case 'goodOverRungG':
      return msgHelp(goodOverRunGoal);
    default:
      throw Exception('Improper category given');
  }
}

String msgHelp(List<String> a) {
  var rng = new Random();         // Random number generator
  int i = rng.nextInt(a.length);  // Pick a random message
  return a[i];
}
