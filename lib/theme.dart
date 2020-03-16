import 'package:flutter/material.dart';

class AppColors {
  // light green
  static const primaryColor = const Color(0xFF1bb390);
  static const darkBackgroundColor = const Color(0xFF353d4a);
}

final TextTheme appTextTheme = new TextTheme(
  headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  body1: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
);

final ThemeData appThemeData = new ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(color: AppColors.primaryColor),
    backgroundColor: AppColors.darkBackgroundColor,
    textTheme: appTextTheme);