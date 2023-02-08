import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../domain/entities/schedule_entity.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'ksc'.toUpperCase(),
              style:  TextStyle(fontWeight: FontWeight.bold,color:Theme.of(context).colorScheme.onTertiary),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
                child: widget.selectedDay == 0
                    ? ListView.separated(
                        itemCount: widget.schedule.sunday!.ksc!.meals!.length,
                        itemBuilder: (context, index) {
                          return AutoSizeText(
                              '• ${widget.schedule.sunday!.ksc!.meals![index].meal}',style: TextStyle(color:Theme.of(context).colorScheme.onTertiary
                              
                              ),);
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
                                widget.schedule.monday!.ksc!.meals!.length,
                            itemBuilder: (context, index) {
                              return AutoSizeText(
                                  '• ${widget.schedule.monday!.ksc!.meals![index].meal}',style: TextStyle(color:Theme.of(context).colorScheme.onTertiary));
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
                                itemCount:
                                    widget.schedule.tuesday!.ksc!.meals!.length,
                                itemBuilder: (context, index) {
                                  return AutoSizeText(
                                      '• ${widget.schedule.tuesday!.ksc!.meals![index].meal}',style: TextStyle(color: Theme.of(context).colorScheme.onTertiary));
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
                                itemCount:
                                    widget.schedule.wednesday!.ksc!.meals!.length,
                                itemBuilder: (context, index) {
                                  return AutoSizeText(
                                      '• ${widget.schedule.wednesday!.ksc!.meals![index].meal}',style: TextStyle(color:Theme.of(context).colorScheme.onTertiary));
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
                                            .ksc!.meals!.length,
                                        itemBuilder: (context, index) {
                                          return AutoSizeText(
                                              '• ${widget.schedule.thursday!.ksc!.meals![index].meal}',style: TextStyle(color: Theme.of(context).colorScheme.onTertiary));
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(
                                            height: 5,
                                          );
                                        },
                                      )
                                    : widget.selectedDay == 5
                                        ? Container()
                                        : Container()),
          ],
        ),
      ),
    );
  }
}
