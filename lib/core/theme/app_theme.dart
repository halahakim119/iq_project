import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final lightTheme = FlexThemeData.light(
  useMaterial3: true,
  scheme: FlexScheme.rosewood,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  scaffoldBackground: Colors.grey.shade200,
  background: Colors.white,
  onSecondary: Colors.white,
    onTertiary: Color.fromARGB(255, 67, 2, 2),
  onPrimary: Color.fromARGB(255, 145, 24, 46),
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 40,
    blendOnColors: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);

final darkTheme = FlexThemeData.dark(
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  onTertiary: Colors.white,
  // scaffoldBackground:  Color.fromARGB(255, 35, 28, 28),
  // onPrimary: Color.fromARGB(255, 132, 132, 132),
  background: Color.fromARGB(255, 255, 255, 255),
  onSecondary: Color.fromARGB(255, 46, 36, 36),
  // primary: Color.fromARGB(255, 45, 0, 0),
  
  primary: Color.fromARGB(255, 19, 0, 0),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
);
