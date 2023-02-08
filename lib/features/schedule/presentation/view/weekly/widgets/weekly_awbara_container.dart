import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';

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
  String selectedChoice = '';

  void _submit() {
    setState(() {
      selectedChoice =
          widget.schedule.sunday!.awbara!.meals![_selectedIndex].toString();
    });
  }

  @override
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'awbara'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: widget.selectedDay == 0
                    ? ListView.separated(
                        itemCount:
                            widget.schedule.sunday!.awbara!.meals!.length,
                        itemBuilder: (context, index) {
                          return Text(
                              '• ${widget.schedule.sunday!.awbara!.meals![index].meal}');
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                      )
                    : widget.selectedDay == 1
                        ? ListView.separated(
                            itemCount:
                                widget.schedule.monday!.awbara!.meals!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  '• ${widget.schedule.monday!.awbara!.meals![index].meal}');
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 5,
                              );
                            },
                          )
                        : widget.selectedDay == 2
                            ? ListView.separated(
                                itemCount: widget
                                    .schedule.tuesday!.awbara!.meals!.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                      '• ${widget.schedule.tuesday!.awbara!.meals![index].meal}');
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 5,
                                  );
                                },
                              )
                            : widget.selectedDay == 3
                                ? ListView.separated(
                                    itemCount: widget.schedule.wednesday!.awbara!
                                        .meals!.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          '• ${widget.schedule.wednesday!.awbara!.meals![index].meal}');
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(
                                        height: 5,
                                      );
                                    },
                                  )
                                : widget.selectedDay == 4
                                    ? ListView.separated(
                                        itemCount: widget.schedule.thursday!
                                            .awbara!.meals!.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                              '• ${widget.schedule.thursday!.awbara!.meals![index].meal}');
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(
                                            height: 5,
                                          );
                                        },
                                      )
                                    : widget.selectedDay == 5
                                        ?Container()
                                        : Container()),
          ],
        ),
      ),
    );
  }
}
