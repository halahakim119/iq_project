import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import 'daily_awbara_container.dart';

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
    int hour = DateTime.now().hour;

    return (hour >= 8 && hour < 14)
        ? FutureBuilder(
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
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            customGestureDetector('ksc'),
                            customGestureDetector('awbara'),
                          ],
                        ),
                      ),
                      selectedRestaurant == "awbara"
                          ? DailyAwbaraContainer(
                              schedule: widget.schedule,
                              selectedDay: snapshot.data.toString() == "Sunday"
                                  ? 0
                                  : snapshot.data.toString() == "Monday"
                                      ? 1
                                      : snapshot.data.toString() == "Tuesday"
                                          ? 2
                                          : snapshot.data.toString() ==
                                                  "Wednesday"
                                              ? 3
                                              : snapshot.data.toString() ==
                                                      "Thursday"
                                                  ? 4
                                                  : 5,
                            )
                          : DailyAwbaraContainer(
                              schedule: widget.schedule,
                              selectedDay: snapshot.data.toString() == "Sunday"
                                  ? 0
                                  : snapshot.data.toString() == "Monday"
                                      ? 1
                                      : snapshot.data.toString() == "Tuesday"
                                          ? 2
                                          : snapshot.data.toString() ==
                                                  "Wednesday"
                                              ? 3
                                              : snapshot.data.toString() ==
                                                      "Thursday"
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
          )
        : Center(
            child: Text('food is not ready yet'),
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
                  ? Theme.of(context).primaryColor
                  : Colors.white),
          child: Center(
            child: Text(
              restaurant.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedRestaurant == restaurant
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
