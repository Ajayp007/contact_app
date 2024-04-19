import 'package:flutter/material.dart';

ThemeData light_Theme = ThemeData(
  colorSchemeSeed:
      MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
  fontFamily: "TiltNeon",
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 22,
    ),
    labelSmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigo.shade100, foregroundColor: Colors.black),
);

ThemeData dark_Theme = ThemeData(
  popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white, textStyle: TextStyle(color: Colors.black)),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
      iconColor: MaterialStateColor.resolveWith((states) => Colors.white),
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  colorSchemeSeed:
      MaterialStateColor.resolveWith((states) => Colors.blue.shade900),
  fontFamily: "TiltNeon",
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue.shade700, foregroundColor: Colors.white),
);
