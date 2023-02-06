import 'dart:async';
import 'package:iq_project/core/network/internet_checker.dart';

import '../../../../../core/injection/injection_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({super.key});

  @override
  State<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  @override
  void initState() {
    super.initState();

    sl<InternetChecker>().run();
    
    Future.delayed(const Duration(seconds: 2), () {
      final token = "token";
        
      if (token.isNotEmpty) {
        context.router.pushNamed('main');
      } else {
        context.router.pushNamed('auth');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            const Text(
              'WHAT DO WE HAVE?',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            LoadingBouncingGrid.square(
              borderColor: Theme.of(context).colorScheme.primary,
              borderSize: 0.5,
              size: 30.0,
              backgroundColor: Theme.of(context).colorScheme.primary,
              duration: const Duration(milliseconds: 1500),
            ),
          ],
        ),
      ),
    );
  }
}
