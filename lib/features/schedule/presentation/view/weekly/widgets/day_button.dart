import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DayButton extends StatelessWidget {
  final String day;
  final int index;
  final int selectedDay;
  final Function onPressed;

  DayButton(
      {required this.day,
      required this.index,
      required this.selectedDay,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(index),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.13,
        height: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            color: index == selectedDay
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary),
        child: Center(
            child: AutoSizeText(
          day,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: index == selectedDay
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSecondary),
        )),
      ),
    );
  }
}
