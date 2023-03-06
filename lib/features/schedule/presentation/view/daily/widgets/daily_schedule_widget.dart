import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'daily_container.dart';

class DailyScheduleWidget extends StatefulWidget {
  final List<dynamic> kscSchedule;
  final List<dynamic> awbaraSchedule;

  const DailyScheduleWidget(
      {required this.kscSchedule, required this.awbaraSchedule});

  @override
  State<DailyScheduleWidget> createState() => _DailyScheduleWidgetState();
}

class _DailyScheduleWidgetState extends State<DailyScheduleWidget> {
  String selectedRestaurant = 'ksc';

  void onPressed(String restaurant) {
    setState(() {
      selectedRestaurant = restaurant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onPressed('ksc'),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      color: selectedRestaurant == 'ksc'
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'ksc'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedRestaurant == 'ksc'
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onPressed('awbara'),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: selectedRestaurant == 'awbara'
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        'awbara'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedRestaurant == 'awbara'
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        FutureBuilder<String>(
          future: _getCurrentDay(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return selectedRestaurant == 'ksc'
                  ? DailyContainer(
                      restaurant: selectedRestaurant,
                      schedule: widget.kscSchedule,
                      selectedDay: snapshot.data.toString() == "Sunday"
                          ? 0
                          : snapshot.data.toString() == "Monday"
                              ? 1
                              : snapshot.data.toString() == "Tuesday"
                                  ? 2
                                  : snapshot.data.toString() == "Wednesday"
                                      ? 3
                                      : snapshot.data.toString() == "Thursday"
                                          ? 4
                                          : 5,
                    )
                  : DailyContainer(
                      restaurant: selectedRestaurant,
                      schedule: widget.awbaraSchedule,
                      selectedDay: snapshot.data.toString() == "Sunday"
                          ? 0
                          : snapshot.data.toString() == "Monday"
                              ? 1
                              : snapshot.data.toString() == "Tuesday"
                                  ? 2
                                  : snapshot.data.toString() == "Wednesday"
                                      ? 3
                                      : snapshot.data.toString() == "Thursday"
                                          ? 4
                                          : 5,
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Future<String> _getCurrentDay() async {
    DateTime now = DateTime.now();

    switch (now.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  Widget customGestureDetector(String restaurant) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(restaurant),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: selectedRestaurant == restaurant
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary),
          child: Center(
            child: AutoSizeText(
              restaurant.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedRestaurant == restaurant
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
