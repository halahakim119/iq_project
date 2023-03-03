import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.01, 1]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    AutoSizeText(
                      'IHUNGRY',
                      style: TextStyle(
                          letterSpacing: 4,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 28,
                          fontFamily: 'Monoton'),
                    ),
                    const SizedBox(height: 40),
                    AutoSizeText(
                      textAlign: TextAlign.center,
                      'Welcome to the HQ food ordering app, where hunger and cravings meet their match! This app is developed by thr Mobile Application Development team of iQ who know the importance of a good meal during a long work day. Remember, this app is exclusively for our beloved employees, so let\'s make the most of it.',
                      maxLines: 10,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () => context.router.pop(),
                        color: Theme.of(context).colorScheme.onPrimary,
                        icon: const Icon(Icons.chevron_left_rounded)),
                    AutoSizeText(
                      textAlign: TextAlign.center,
                      'Back',
                      maxLines: 10,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
