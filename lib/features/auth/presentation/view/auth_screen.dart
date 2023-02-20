import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:iq_project/features/auth/presentation/view/signup_form.dart';

import 'login_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String selectedMethod = 'Log In';
  void onPressed(String method) {
    setState(() {
      this.selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'IHUNGRY?',
                      style: TextStyle(
                          fontFamily: 'Monoton',
                          fontSize: 32,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 0.8,
                              color: Theme.of(context).colorScheme.primary),
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          customGestureDetector('Log In'),
                          customGestureDetector('Sign Up'),
                        ],
                      ),
                    ),
                    Container(
                     width: MediaQuery.of(context).size.width*0.8,
                      child: selectedMethod == 'Log In'
                          ? LoginForm()
                          : SignUpForm(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customGestureDetector(String method) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(method),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: selectedMethod == method
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSecondary),
          child: Center(
            child: AutoSizeText(
              method.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedMethod == method
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
