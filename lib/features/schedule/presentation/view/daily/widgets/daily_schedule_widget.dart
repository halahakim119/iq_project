import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import 'daily_container.dart';

class DailyScheduleWidget extends StatefulWidget {
  ScheduleEntity schedule;

  DailyScheduleWidget({required this.schedule});
  @override
  State<DailyScheduleWidget> createState() => _DailyScheduleWidgetState();
}

class _DailyScheduleWidgetState extends State<DailyScheduleWidget> {
  String selectedRestaurant = 'ksc';
  void onPressed(String selectedRestaurant) {
    setState(() {
      this.selectedRestaurant = selectedRestaurant;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentDay(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Theme.of(context).colorScheme.primary),
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      customGestureDetector('ksc'),
                      customGestureDetector('awbara'),
                    ],
                  ),
                ),
                selectedRestaurant == "ksc"
                    ? DailyContainer(
                        restaurant: selectedRestaurant,
                        schedule: widget.schedule,
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
                        schedule: widget.schedule,
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
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<String> _getCurrentDay() async {
    DateTime now = DateTime.now();
    int dayOfWeek = now.weekday;
    switch (dayOfWeek) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
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
