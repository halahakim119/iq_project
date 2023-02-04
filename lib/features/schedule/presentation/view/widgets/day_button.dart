import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(100),
            color: index == selectedDay
                ? const Color.fromARGB(255, 119, 29, 22)
                : Colors.red.shade100),
        child: Center(
            child: Text(
          day,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: index == selectedDay ? Colors.white : const Color.fromARGB(255, 119, 29, 22)),
        )),
      ),
    );
  }
}