import 'package:flutter/material.dart';
import 'package:iq_project/core/splash/loading_splash.dart';
import 'core/injection/injection_container.dart' as di;
import 'core/network/internet_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (ctx, timer) => timer.connectionState == ConnectionState.done
              ? const InternetChecker()
              : const LoadingSplash()),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
