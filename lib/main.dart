import 'package:flutter/material.dart';

import 'core/injection/injection_container.dart' as di;
import 'core/network/internet_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  di.setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InternetChecker(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
