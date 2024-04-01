import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/utils/color_utils.dart';


Container topArc({required Widget childWidget}){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(200)),
        color: background),
    height: MediaQuery.of(navigatorKey.currentContext!).size.height * 0.20,
    width: MediaQuery.of(navigatorKey.currentContext!).size.width,
    child: childWidget,
  );
}


Container bottomArc({required Widget childWidget}){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(120),
            topLeft: Radius.circular(120)),
        color: background),
    height: MediaQuery.of(navigatorKey.currentContext!).size.height * 0.10,
    width: MediaQuery.of(navigatorKey.currentContext!).size.width,
    child: childWidget,
  );
}