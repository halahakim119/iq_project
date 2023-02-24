import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: FlexThemeData.light(
    useMaterial3: true,
    scaffoldBackground: Colors.white,
    primary: Color.fromARGB(255, 255, 77, 0),
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
  ),
  AppTheme.darkTheme: FlexThemeData.dark(
    useMaterial3: true,
    scaffoldBackground: Colors.black,
    primary: Color.fromARGB(255, 255, 77, 0),
    onPrimary: Colors.white,
    secondary: Colors.grey.shade900,
    onSecondary: Colors.white,
  )
};
