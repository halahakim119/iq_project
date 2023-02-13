import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';
import 'day_meals.dart';

class WeeklyKSCContainer extends StatefulWidget {
  int selectedDay;
  ScheduleEntity schedule;
  WeeklyKSCContainer({
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<WeeklyKSCContainer> createState() => _WeeklyKSCContainerState();
}

class _WeeklyKSCContainerState extends State<WeeklyKSCContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        // color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              ' ksc'.toUpperCase(),
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.onTertiary),
            ),
            const SizedBox(
              height: 5,
            ),
              Container(
                child: widget.selectedDay == 0
                    ? DayMeals(widget.schedule.sunday!.ksc!.meals!)
                    : widget.selectedDay == 1
                        ? DayMeals(widget.schedule.monday!.ksc!.meals!)
                        : widget.selectedDay == 2
                            ? DayMeals(widget.schedule.tuesday!.ksc!.meals!)
                            : widget.selectedDay == 3
                                ? DayMeals(
                                    widget.schedule.wednesday!.ksc!.meals!)
                                : widget.selectedDay == 4
                                    ? DayMeals(
                                        widget.schedule.thursday!.ksc!.meals!)
                                    : widget.selectedDay == 5
                                        ? Container()
                                        : Container()),
          ],
        ),
      ),
    );
  }
}
