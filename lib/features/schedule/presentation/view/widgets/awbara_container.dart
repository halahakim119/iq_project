import '../../../domain/entities/schedule_entity.dart';
import 'package:flutter/material.dart';

class AwbaraContainer extends StatelessWidget {
  int selectedDay;
  ScheduleEntity schedule;
  AwbaraContainer({
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
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  Text(
              'Awbara',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: selectedDay == 0
                    ? ListView.builder(
                        itemCount: schedule.sunday!.awbara!.length,
                        itemBuilder: (context, index) {
                          return Text(
                              schedule.sunday!.awbara![index].toString());
                        })
                    : selectedDay == 1
                        ? ListView.builder(
                            itemCount: schedule.monday!.awbara!.length,
                            itemBuilder: (context, index) {
                              return Text(
                                  schedule.monday!.awbara![index].toString());
                            })
                        : selectedDay == 2
                            ? ListView.builder(
                                itemCount: schedule.tuesday!.awbara!.length,
                                itemBuilder: (context, index) {
                                  return Text(schedule.tuesday!.awbara![index]
                                      .toString());
                                })
                            : selectedDay == 3
                                ? ListView.builder(
                                    itemCount: schedule.tuesday!.awbara!.length,
                                    itemBuilder: (context, index) {
                                      return Text(schedule
                                          .tuesday!.awbara![index]
                                          .toString());
                                    })
                                : selectedDay == 4
                                    ? ListView.builder(
                                        itemCount:
                                            schedule.wednesday!.awbara!.length,
                                        itemBuilder: (context, index) {
                                          return Text(schedule
                                              .wednesday!.awbara![index]
                                              .toString());
                                        })
                                    : selectedDay == 3
                                        ? ListView.builder(
                                            itemCount: schedule
                                                .thursday!.awbara!.length,
                                            itemBuilder: (context, index) {
                                              return Text(schedule
                                                  .thursday!.awbara![index]
                                                  .toString());
                                            })
                                        : Container())
          ],
        ),
      ),
    );
  }
}
