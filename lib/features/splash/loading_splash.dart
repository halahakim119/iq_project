import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../core/network/internet_checker.dart';
import '../profile/data/models/user_model.dart';

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
          await getUserType();
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

  Future<void> getUserType() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/${currentUser!.uid}').get();

    if (snapshot.exists) {
      final dataString = json.encode(snapshot.value);

      Map<String, dynamic> data = json.decode(dataString);

      final userEntity = UserModel.fromFirebaseMap(data);

      if (userEntity.uType != null) {
        if (userEntity.uType == 'normal') {
          context.router.pushNamed('main');
        } else if (userEntity.uType == 'KSCKitchen') {
          context.router.pushNamed('kitchen');
        } else if (userEntity.uType == 'AwbaraKitchen') {
          context.router.pushNamed('kitchen');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Unknown user type.'),
          ));
          context.router.pushNamed('auth');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User type is not defined.'),
        ));
        context.router.pushNamed('auth');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User data not found.'),
      ));
      context.router.pushNamed('auth');
    }
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
