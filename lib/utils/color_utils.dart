import 'package:flutter/material.dart';


hexStringToColor(String hexColor){
  hexColor = hexColor.toUpperCase().replaceAll('#', "");
  if(hexColor.length == 6){
    hexColor = "FF"+hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}



const Color yellow   = Color(0xFFF7AA54);

const Color purple = Color(0xFF887CDD);

const Color offWhite = Color(0xFFFFCFAE);

const Color correct = Color(0xFF32AB58);
// set color for incorrect answer
const Color incorrect = Color(0xFFA60000);
// set a neutral color
// not going to take pure white because it hurts eyes.
const Color neutral = Color(0xFFE7E7E7);
// set some background color
const Color background = Color(0xFFD49218);

const Color redLight = Color(0xFFFFA4A4);

const Color greenLight = Color(0xFF9CEF9D);

const Color questionColor = Color(0xFF021A2F);
