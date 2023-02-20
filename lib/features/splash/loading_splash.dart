import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

    Future.delayed(const Duration(seconds: 3), () async {
      final FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;

      if (user != null) {
        if (user.emailVerified) {
          context.router.pushNamed('main');
        } else {
          Scaffold(
            body: Container(child: Text('not varified')),
          );
        }
      } else {
        context.router.pushNamed('auth');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            AutoSizeText(
              'IHUNGRY?',
              style: TextStyle(
                  fontFamily: 'Monoton',
                  fontSize: 32,
                  color: Theme.of(context).colorScheme.background),
            ),
            LoadingBouncingGrid.square(
              borderColor: Theme.of(context).colorScheme.background,
              borderSize: 0.5,
              size: 30.0,
              backgroundColor: Theme.of(context).colorScheme.background,
              duration: const Duration(milliseconds: 1500),
            ),
          ],
        ),
      ),
    );
  }
}
