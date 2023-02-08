import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const AutoSizeText('data')),
      body: const Center(
        child: AutoSizeText('Auth'),
      ),
    );
  }
}
