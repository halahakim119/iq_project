import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

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
              const Text(
                'Internet Connection Lost',
              ),
            ],
          ),
          LoadingBouncingGrid.square(
            borderColor: const Color.fromARGB(255, 119, 29, 22),
            borderSize: 0.5,
            size: 30.0,
            backgroundColor: const Color.fromARGB(255, 119, 29, 22),
            duration: const Duration(milliseconds: 1500),
          )
        ],
      ),
    ));
  }
}
