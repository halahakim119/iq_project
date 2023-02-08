import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import '../widgets/day_button.dart';
import 'weekly_awbara_container.dart';
import 'weekly_ksc_container.dart';

class WeeklySchedulaWidget extends StatefulWidget {
  ScheduleEntity schedule;

  WeeklySchedulaWidget({required this.schedule});

  @override
  State<WeeklySchedulaWidget> createState() => _WeeklySchedulaWidgetState();
}

class _WeeklySchedulaWidgetState extends State<WeeklySchedulaWidget> {
  int selectedDay = 0;
  void onPressed(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21))),
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
              
                height: 60,
                width: double.infinity,
                decoration:  BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DayButton(
                      day: 'Sun',
                      index: 0,
                      selectedDay: selectedDay,
                      onPressed: onPressed,
                    ),
                    DayButton(
                      day: 'Mon',
                      index: 1,
                      selectedDay: selectedDay,
                      onPressed: onPressed,
                    ),
                    DayButton(
                      day: 'Tue',
                      index: 2,
                      selectedDay: selectedDay,
                      onPressed: onPressed,
                    ),
                    DayButton(
                      day: 'Wed',
                      index: 3,
                      selectedDay: selectedDay,
                      onPressed: onPressed,
                    ),
                    DayButton(
                      day: 'Thu',
                      index: 4,
                      selectedDay: selectedDay,
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              WeeklyKSCContainer(
                  schedule: widget.schedule, selectedDay: selectedDay),
              const SizedBox(
                height: 15,
              ),
              WeeklyAwbaraContainer(
                  schedule: widget.schedule, selectedDay: selectedDay),
            ],
          ),
        ),
      ),
    );
  }
}
