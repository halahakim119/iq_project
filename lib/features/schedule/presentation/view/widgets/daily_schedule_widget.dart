import 'dart:async';

import 'package:flutter/material.dart';

import '../../../domain/entities/schedule_entity.dart';
import 'awbara_container.dart';
import 'ksc_container.dart';

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
    return Container(
      child: FutureBuilder(
        future: _getCurrentDay(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // padding: const EdgeInsets.only(top: 5, bottom: 5),
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      bottomLeft: Radius.circular(50),
                                      topLeft: Radius.circular(50)),
                                  color: selectedRestaurant == 'ksc'
                                      ? const Color.fromARGB(255, 119, 29, 22)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'ksc',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedRestaurant == 'ksc'
                                          ? Colors.white
                                          : Colors.black),
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
                                      bottomRight: Radius.circular(50)),
                                  color: selectedRestaurant == 'awbara'
                                      ? const Color.fromARGB(255, 119, 29, 22)
                                      : Colors.white),
                              child: Center(
                                child: Text(
                                  'awbara',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: selectedRestaurant == 'awbara'
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        )

                        // Text(snapshot.data.toString(),
                        //     style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  selectedRestaurant == "ksc"
                      ? KSCContainer(
                          selectedSchedule: "daily",
                          schedule: widget.schedule,
                          selectedDay: snapshot.data.toString() == "Sunday"
                              ? 0
                              : snapshot.data.toString() == "Monday"
                                  ? 1
                                  : snapshot.data.toString() == "Tuesday"
                                      ? 2
                                      : snapshot.data.toString() == "Wednesday"
                                          ? 3
                                          : snapshot.data.toString() ==
                                                  "Thursday"
                                              ? 4
                                              : 5,
                        )
                      : AwbaraContainer(
                          selectedSchedule: "daily",
                          schedule: widget.schedule,
                          selectedDay: snapshot.data.toString() == "Sunday"
                              ? 0
                              : snapshot.data.toString() == "Monday"
                                  ? 1
                                  : snapshot.data.toString() == "Tuesday"
                                      ? 2
                                      : snapshot.data.toString() == "Wednesday"
                                          ? 3
                                          : snapshot.data.toString() ==
                                                  "Thursday"
                                              ? 4
                                              : 5,
                        ),
                ],
              ),
            );
          } else {
            return Text('Loading...');
          }
        },
      ),
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
}
