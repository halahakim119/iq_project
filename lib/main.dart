import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';

import 'core/injection/injection_container.dart' as di;
import 'features/schedule/presentation/logic/cubit/schedule_cubit.dart';
import 'core/router/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  di.setupLocator();
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
          create: (context) => di.sl<ScheduleCubit>()..fetchData(),
        ),
      ],
      child: OverlaySupport.global(
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey.shade200,
              useMaterial3: true,
              colorScheme: const ColorScheme.light(
                secondary: Colors.white,
              ),
              indicatorColor: const Color.fromARGB(255, 119, 29, 22),
              primaryColor: Color.fromARGB(255, 255, 17, 0),
              backgroundColor: Colors.grey.shade200),
        ),
      ),
    );
  }
}
