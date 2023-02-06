import 'package:iq_project/main.dart';

import '../../../../domain/entities/schedule_entity.dart';
import 'package:flutter/material.dart';

class KSCContainer extends StatefulWidget {
  int selectedDay;
  String selectedSchedule;
  ScheduleEntity schedule;
  KSCContainer({
    required this.selectedSchedule,
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<KSCContainer> createState() => _KSCContainerState();
}

class _KSCContainerState extends State<KSCContainer> {
  String selectedChoice = '';

  void _submit() {
    setState(() {
      selectedChoice = widget.schedule.sunday!.ksc![_selectedIndex].toString();
    });
  }

  @override
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.selectedSchedule == "weekly"
          ? MediaQuery.of(context).size.height * 0.25
          : MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: widget.selectedSchedule == "weekly"
            ? const EdgeInsets.only(top: 30.0, left: 30.0, bottom: 10)
            : const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.selectedSchedule == "weekly"
                ? const Text(
                    'KSC',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 15, left: 30),
                    child: Text(
                      'Todays schedule',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
            Expanded(
                child: widget.selectedDay == 0
                    ? ListView.builder(
                        itemCount: widget.schedule.sunday!.ksc!.length,
                        itemBuilder: (context, index) {
                          return widget.selectedSchedule == "daily"
                              ? RadioListTile(
                                  dense: true,
                                  activeColor:
                                      Theme.of(context).colorScheme.primary,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text(widget
                                      .schedule.sunday!.ksc![index]
                                      .toString()),
                                  value: index,
                                  groupValue: _selectedIndex,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedIndex = value!;
                                    });
                                  },
                                )
                              : Text(widget.schedule.sunday!.ksc![index]
                                  .toString());
                        },
                      )
                    : widget.selectedDay == 1
                        ? ListView.builder(
                            itemCount: widget.schedule.monday!.ksc!.length,
                            itemBuilder: (context, index) {
                              return Text(widget.schedule.monday!.ksc![index]
                                  .toString());
                            })
                        : widget.selectedDay == 2
                            ? ListView.builder(
                                itemCount: widget.schedule.tuesday!.ksc!.length,
                                itemBuilder: (context, index) {
                                  return Text(widget
                                      .schedule.tuesday!.ksc![index]
                                      .toString());
                                })
                            : widget.selectedDay == 3
                                ? ListView.builder(
                                    itemCount:
                                        widget.schedule.tuesday!.ksc!.length,
                                    itemBuilder: (context, index) {
                                      return Text(widget
                                          .schedule.tuesday!.ksc![index]
                                          .toString());
                                    })
                                : widget.selectedDay == 4
                                    ? ListView.builder(
                                        itemCount: widget
                                            .schedule.wednesday!.ksc!.length,
                                        itemBuilder: (context, index) {
                                          return Text(widget
                                              .schedule.wednesday!.ksc![index]
                                              .toString());
                                        })
                                    : widget.selectedDay == 3
                                        ? ListView.builder(
                                            itemCount: widget
                                                .schedule.thursday!.ksc!.length,
                                            itemBuilder: (context, index) {
                                              return Text(widget.schedule
                                                  .thursday!.ksc![index]
                                                  .toString());
                                            })
                                        : Container()),
            widget.selectedSchedule == "daily"
                ? Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () => _submit(),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.7, 50),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          child: const Text(
                            'submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  )
                : SizedBox(),
            Text(selectedChoice)
          ],
        ),
      ),
    );
  }
}
