import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Splash404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.7,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/404.png'),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          AutoSizeText(
            'Oops!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            'An issue accured please try again later',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ]),
      ),
    );
  }
}
