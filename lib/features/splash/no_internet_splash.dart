import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
class NoInternetSplash extends StatelessWidget {
  const NoInternetSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          Column(
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 150,
                color: Colors.grey.shade300,
              ),
              const AutoSizeText(
                'Internet Connection Lost',
              ),
            ],
          ),
          LoadingBouncingGrid.square(
            borderColor: Theme.of(context).colorScheme.onTertiary,
            borderSize: 0.5,
            size: 30.0,
            backgroundColor: Theme.of(context).colorScheme.onTertiary,
            duration: const Duration(milliseconds: 1500),
          )
        ],
      ),
    ));
  }
}
