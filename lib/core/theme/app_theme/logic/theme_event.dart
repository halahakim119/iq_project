import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

@immutable
abstract class ThemeEvent extends Equatable {}

class ThemeChanged extends ThemeEvent {
  final AppTheme? theme;

  ThemeChanged({
    required this.theme,
  });

  @override
  List<Object?> get props => [theme];
}
