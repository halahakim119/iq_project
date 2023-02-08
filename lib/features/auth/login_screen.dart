import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AutoSizeText('login'),
      ),
    );
  }
}
