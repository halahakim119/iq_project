import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../core/network/internet_checker.dart';
import '../profile/data/datasource/user_data_source.dart';

class LoadingSplash extends StatefulWidget {
  const LoadingSplash({super.key});

  @override
  State<LoadingSplash> createState() => _LoadingSplashState();
}

class _LoadingSplashState extends State<LoadingSplash> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    di.sl<InternetChecker>().run();

    Future.delayed(const Duration(seconds: 3), () async {
      _user = _auth.currentUser;
      if (_user != null) {
        if (_user!.emailVerified) {
          var uType = await UserDataSource.getUserType();
          uType.fold((failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(failure.message),
            ));
            context.router.pushNamed('auth');
          }, (type) {
            if (type == 'normal') {
              context.router.pushNamed('main');
            } else if (type == 'ksc') {
              context.router.pushNamed('kitchen');
            } else if (type == 'awbara') {
              context.router.pushNamed('kitchen');
            } else if (type == 'hq') {
              context.router.pushNamed('HQ');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Unknown user type.'),
              ));
              context.router.pushNamed('auth');
            }
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Your email is not verified.'),
          ));
          context.router.pushNamed('auth');
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
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            LoadingBouncingGrid.square(
              borderColor: Theme.of(context).colorScheme.onPrimary,
              borderSize: 0.5,
              size: 30.0,
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              duration: const Duration(milliseconds: 1500),
            ),
          ],
        ),
      ),
    );
  }
}
