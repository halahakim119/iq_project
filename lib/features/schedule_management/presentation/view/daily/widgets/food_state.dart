import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'count_down_timer.dart';

class FoodState extends StatefulWidget {
  const FoodState({super.key});

  @override
  State<FoodState> createState() => _FoodStateState();
}

class _FoodStateState extends State<FoodState> {
  int hour = DateTime.now().hour;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        hour = DateTime.now().hour;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (hour >= 6 && hour < 9)
                    ? const AssetImage('assets/images/waiting.png')
                    : (hour >= 12 && hour < 13)
                        ? const AssetImage('assets/images/eating.png')
                        : const AssetImage('assets/images/no_work.png'),
                fit: BoxFit.contain),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
      ),
      (hour >= 6 && hour < 9)
          ? customAutoSizeText(
              'Menu Not Ready',
              'Today\'s menu is not set yet, please check back later at 9:00',
              context)
          : (hour >= 12 && hour < 13)
              ? customAutoSizeText(
                  'Lunch time',
                  'The food is ready, come and enjoy a delicious meal.',
                  context)
              : customAutoSizeText(
                  'Closed',
                  'Sorry, we\'re not serving food outside of our work hours. Please come back tomorrow.',
                  context),
      (hour >= 12 && hour < 13)
          ? Container(
              margin: const EdgeInsets.only(top: 20),
              child: CountDownTimer(),
            )
          : const SizedBox()
    ]);
  }

  Widget customAutoSizeText(boldText, normalText, context) {
    return Container(
      margin: const EdgeInsets.only(right: 25, left: 25),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AutoSizeText(
            boldText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(
            normalText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
