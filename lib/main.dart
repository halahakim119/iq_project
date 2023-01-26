import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'my_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: MyHomePage());
  }
}
