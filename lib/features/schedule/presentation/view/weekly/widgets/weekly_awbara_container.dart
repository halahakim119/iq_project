import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../domain/entities/schedule_entity.dart';
import 'day_meals.dart';

class WeeklyAwbaraContainer extends StatefulWidget {
  int selectedDay;
  ScheduleEntity schedule;
  WeeklyAwbaraContainer({
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<WeeklyAwbaraContainer> createState() => _WeeklyAwbaraContainerState();
}

class _WeeklyAwbaraContainerState extends State<WeeklyAwbaraContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0,  bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'awbara'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            
              child: widget.selectedDay == 0
                  ? DayMeals(widget.schedule.sunday!.awbara!.meals!)
                  : widget.selectedDay == 1
                      ? DayMeals(widget.schedule.monday!.awbara!.meals!)
                      : widget.selectedDay == 2
                          ? DayMeals(widget.schedule.tuesday!.awbara!.meals!)
                          : widget.selectedDay == 3
                              ? DayMeals(
                                  widget.schedule.wednesday!.awbara!.meals!)
                              : widget.selectedDay == 4
                                  ? DayMeals(widget
                                      .schedule.thursday!.awbara!.meals!)
                                  : widget.selectedDay == 5
                                      ? Container()
                                      : Container()),
        ],
      ),
    );
  }
}
