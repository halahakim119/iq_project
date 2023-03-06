import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/injection/injection_container.dart' as di;
import 'core/router/router.gr.dart';
import 'core/theme/app_theme/app_theme.dart';
import 'core/theme/app_theme/logic/theme_bloc.dart';
import 'core/theme/app_theme/logic/theme_event.dart';
import 'core/theme/app_theme/logic/theme_state.dart';
import 'features/auth/presentation/logic/cubit/authentication_cubit.dart';
import 'features/schedule/presentation/logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<GetAllMealsCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              ThemeBloc()..add(ThemeChanged(theme: getSavedTheme())),
        ),
        BlocProvider(
          create: (context) => di.sl<AuthenticationCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return OverlaySupport.global(
            child: MaterialApp.router(
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                theme: state.themeData),
          );
        },
      ),
    );
  }

  AppTheme getSavedTheme() {
    final index = prefs.getInt('theme') ?? 0;
    return AppTheme.values[index];
  }
}
