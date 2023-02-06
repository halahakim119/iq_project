import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import '../widgets/awbara_container.dart';
import '../widgets/day_button.dart';
import '../widgets/ksc_container.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          KSCContainer(
              selectedSchedule: "weekly",
              schedule: widget.schedule,
              selectedDay: selectedDay),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          AwbaraContainer(
              selectedSchedule: "weekly",
              schedule: widget.schedule,
              selectedDay: selectedDay),
        ],
      ),
    );
  }
}
