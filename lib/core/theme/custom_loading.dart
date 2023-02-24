import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LoadingBouncingGrid.square(
        borderColor: Theme.of(context).colorScheme.primary,
        borderSize: 0.5,
        size: 30.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
