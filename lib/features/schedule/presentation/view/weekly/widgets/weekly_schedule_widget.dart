import 'package:flutter/material.dart';

import '../widgets/day_button.dart';

class WeeklySchedulaWidget extends StatefulWidget {
  final kscSchedule;
  final awbaraSchedule;

  WeeklySchedulaWidget(
      {required this.kscSchedule, required this.awbaraSchedule});

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
    return Column(
    
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
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            "KSC",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800),
          ),
        ),
        Expanded(
            flex: 3,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.3,
              ),
              itemCount: widget.kscSchedule[selectedDay].values.length == 1
                  ? 1
                  : widget.kscSchedule[selectedDay]['meals'].values.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.kscSchedule[selectedDay].values.length == 1) {
                  String message = 'no available data';
                  return Center(child: Text(message));
                }
                String mealId = widget.kscSchedule[selectedDay]['meals'].keys
                    .toList()[index];
                String mealName = widget
                    .kscSchedule[selectedDay]['meals'].values
                    .toList()[index];

                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${index + 1} -",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Text(
                    mealName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            )),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            "Awbara",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w800),
          ),
        ),
        Expanded(
            flex: 3,
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.3,
              ),
              itemCount: widget.awbaraSchedule[selectedDay].values.length == 1
                  ? 1
                  : widget.awbaraSchedule[selectedDay]['meals'].values.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.awbaraSchedule[selectedDay].values.length == 1) {
                  String message = 'no available data';
                  return Center(child: Text(message));
                }
                String mealId = widget.awbaraSchedule[selectedDay]['meals'].keys
                    .toList()[index];
                String mealName = widget
                    .awbaraSchedule[selectedDay]['meals'].values
                    .toList()[index];

                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${index + 1} -",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  title: Text(
                    mealName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
