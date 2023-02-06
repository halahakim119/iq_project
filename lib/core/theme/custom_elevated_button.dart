import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function() onPressed;
  Text child;
  double borderRadius;
  CustomElevatedButton(
      {required this.onPressed, required this.child, this.borderRadius = 8.0});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: child,
      ),
    );
  }
}