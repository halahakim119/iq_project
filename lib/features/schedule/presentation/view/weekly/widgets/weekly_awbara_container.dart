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
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10),
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
            Expanded(
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
      ),
    );
  }
}
