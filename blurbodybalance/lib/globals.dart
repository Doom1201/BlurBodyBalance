import 'package:flutter/material.dart';
import 'dart:math';

bool isDark = false;
bool meanMessageOn = true;


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
List<String> generic = new List<String>();// List of generic insults for goals not met.
List<String> overCal = new List<String>();  //insults for going over calorie limit
List<String> underRunGoal = new List<String>(); //insults for not making run goal for the week

generic.add('Oh, there you are. Try to do something productive while youre here.');
generic.add('Oh hey. Need a hand to put yourself back on the bandwagon?');
generic.add('Huh, is it New Years already? Because I haven\'t seen any resolutions for a while.');

overCal.add('Welcome back. Put down the sandwich, we have work to do.');
overCal.add('Welcome back. Put down the cup of whipped cream you call coffee, we have work to do.');

underRunGoal.add('Are you jogging? No? Then get to it!');
underRunGoal.add('I don\'t see legs moving!');


//This function returns a random insult of the specified category.
//IMPORTANT: MAKE SURE MEANMESSAGES IS FALSE BEFORE INVOKING
String getInsult(String cat) {
  var rng;                               //random number generator
  switch (cat) {
    case 'gen':
      rng = new Random();
      int i = rng.nextInt();
      return generic[i];
    case 'overC':
      rng = new Random();
      int i = rng.nextInt();
      return overCal[i];
    case 'underRunG':
      rng = new Random();
      int i = rng.nextInt();
      return underRunGoal[i];
    default:
      throw Exception('Improper category given');
  }
}
