import '../../../domain/entities/schedule_entity.dart';
import 'package:flutter/material.dart';

class KSCContainer extends StatelessWidget {
  int selectedDay;
  ScheduleEntity schedule;
  KSCContainer({
    required this.selectedDay,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius:const  BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'KSC',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: selectedDay == 0
                    ? ListView.builder(
                        itemCount: schedule.sunday!.ksc!.length,
                        itemBuilder: (context, index) {
                          return Text(
                              schedule.sunday!.ksc![index].toString());
                        })
                    : selectedDay == 1
                        ? ListView.builder(
                            itemCount: schedule.monday!.ksc!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  schedule.monday!.ksc![index].toString());
                            })
                        : selectedDay == 2
                            ? ListView.builder(
                                itemCount: schedule.tuesday!.ksc!.length,
                                itemBuilder: (context, index) {
                                  return Text(schedule.tuesday!.ksc![index]
                                      .toString());
                                })
                            : selectedDay == 3
                                ? ListView.builder(
                                    itemCount: schedule.tuesday!.ksc!.length,
                                    itemBuilder: (context, index) {
                                      return Text(schedule
                                          .tuesday!.ksc![index]
                                          .toString());
                                    })
                                : selectedDay == 4
                                    ? ListView.builder(
                                        itemCount:
                                            schedule.wednesday!.ksc!.length,
                                        itemBuilder: (context, index) {
                                          return Text(schedule
                                              .wednesday!.ksc![index]
                                              .toString());
                                        })
                                    : selectedDay == 3
                                        ? ListView.builder(
                                            itemCount: schedule
                                                .thursday!.ksc!.length,
                                            itemBuilder: (context, index) {
                                              return Text(schedule
                                                  .thursday!.ksc![index]
                                                  .toString());
                                            })
                                        : Container())
          ],
        ),
      ),
    );
  }
}
