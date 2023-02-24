import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import '../widgets/day_button.dart';
import 'day_meals.dart';

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
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
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
          selectedDay == 0
              ? DayMeals(
                  KSCMeals: widget.schedule.sunday!.ksc!.meals!,
                  AwbaraMeals: widget.schedule.sunday!.awbara!.meals!)
              : selectedDay == 1
                  ? DayMeals(
                      KSCMeals: widget.schedule.monday!.ksc!.meals!,
                      AwbaraMeals: widget.schedule.monday!.awbara!.meals!)
                  : selectedDay == 2
                      ? DayMeals(
                          KSCMeals: widget.schedule.tuesday!.ksc!.meals!,
                          AwbaraMeals: widget.schedule.tuesday!.awbara!.meals!)
                      : selectedDay == 3
                          ? DayMeals(
                              KSCMeals: widget.schedule.wednesday!.ksc!.meals!,
                              AwbaraMeals:
                                  widget.schedule.wednesday!.awbara!.meals!)
                          : selectedDay == 4
                              ? DayMeals(
                                  KSCMeals:
                                      widget.schedule.thursday!.ksc!.meals!,
                                  AwbaraMeals:
                                      widget.schedule.thursday!.awbara!.meals!)
                              : selectedDay == 5
                                  ? Container()
                                  : Container(),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
