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
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(snapshot.data.toString(),
                            style: TextStyle(fontSize: 20)),
                        ElevatedButton(
                            onPressed: () => onPressed('ksc'),
                            child: Text('KSC')),
                        ElevatedButton(
                            onPressed: () => onPressed('awbara'),
                            child: Text('awbara'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  selectedRestaurant == "ksc"
                      ? KSCContainer(
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
