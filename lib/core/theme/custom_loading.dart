import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/cloche.png',
                  ),
                  fit: BoxFit.contain),
            ),
          ),
          CircularProgressIndicator(
              strokeWidth: 1, 
              color: Theme.of(context).colorScheme.onTertiary),
        ],
      ),
    );
  }
}
