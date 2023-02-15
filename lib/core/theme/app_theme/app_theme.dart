import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

final appThemeData = {
  AppTheme.lightTheme: FlexThemeData.light(
    useMaterial3: true,
    scheme: FlexScheme.rosewood,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 9,
    scaffoldBackground: Colors.grey.shade200,
    background: Colors.white,
    onSecondary: Colors.white,
    primary: Color.fromARGB(255, 255, 77, 0),
    onTertiary: Color.fromARGB(255, 0, 0, 0),
    onPrimary: Color.fromARGB(255, 0, 0, 0),
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 40,
      blendOnColors: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  ),
  AppTheme.darkTheme: FlexThemeData.dark(
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    onTertiary: Colors.white,
    onPrimary: Colors.white,
    background: const Color.fromARGB(255, 255, 255, 255),
    onSecondary: Color.fromARGB(255, 52, 50, 50),
    primary: Color.fromARGB(232, 255, 0, 0),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  )
};
