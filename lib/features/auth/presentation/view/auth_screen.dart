import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'login_form.dart';
import 'signup_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String selectedMethod = 'Log In';
  void onPressed(String method) {
    setState(() {
      selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
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
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        customGestureDetector('Log In'),
                        customGestureDetector('Sign Up'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: selectedMethod == 'Log In'
                        ? const LoginForm()
                        : const SignUpForm(),
                  )
                ],
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
                  : Theme.of(context).colorScheme.secondary),
          child: Center(
            child: AutoSizeText(
              method.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedMethod == method
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
