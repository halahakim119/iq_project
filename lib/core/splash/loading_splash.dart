import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingSplash extends StatelessWidget {
  const LoadingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        const Text(
          'WHAT DO WE HAVE?',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        LoadingBouncingGrid.square(
          borderColor: const Color.fromARGB(255, 119, 29, 22),
          borderSize: 0.5,
          size: 30.0,
          backgroundColor: const Color.fromARGB(255, 119, 29, 22),
          duration: const Duration(milliseconds: 1500),
        ),
      ],
    )));
  }
}
