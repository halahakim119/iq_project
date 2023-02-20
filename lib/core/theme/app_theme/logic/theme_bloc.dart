import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_theme.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: appThemeData[AppTheme.lightTheme])) {
    on<ThemeChanged>((event, emit) {
      emit(ThemeState(themeData: appThemeData[event.theme]));
    });
  }
}

