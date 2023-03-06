import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../app_theme.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeChanged extends ThemeEvent {
  final AppTheme? theme;

  ThemeChanged({
    required this.theme,
  }) {
    saveThemeToPrefs();
  }

  @override
  List<Object?> get props => [theme];

  void saveThemeToPrefs() {
    final index = AppTheme.values.indexOf(theme!);
    prefs.setInt('theme', index);
  }
}
