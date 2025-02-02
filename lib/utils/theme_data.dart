import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
  cardColor: Colors.blueGrey[50],
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey,
      decorationColor: Colors.blueGrey[300],
    ),
    titleSmall: TextStyle(
      color: Colors.blueGrey[900],
    ),
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    displayLarge: TextStyle(color: Colors.blueGrey[800]),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey),
  //brightness: Brightness.light, bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[900]), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.white),
);

var darkThemeData = ThemeData(
  cardColor: Colors.black,
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      color: Colors.blueGrey[200],
      decorationColor: Colors.blueGrey[50],
    ),
    titleSmall: TextStyle(
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      color: Colors.blueGrey[300],
    ),
    displayLarge: TextStyle(
      color: Colors.white70,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey[200]),
  //brightness: Brightness.dark, bottomAppBarTheme: BottomAppBarTheme(color: Colors.black), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(background: Colors.blueGrey[900]),
);
