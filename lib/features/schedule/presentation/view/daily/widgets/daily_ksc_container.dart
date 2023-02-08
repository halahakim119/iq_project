import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';

class DailyKSCContainer extends StatefulWidget {
  int selectedDay;

  ScheduleEntity schedule;
  DailyKSCContainer({
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<DailyKSCContainer> createState() => _DailyKSCContainerState();
}

class _DailyKSCContainerState extends State<DailyKSCContainer> {
  String selectedChoice = '';

  void _submit(text) {
    setState(() {
      selectedChoice = text.toString();
    });
  }

  @override
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15, left: 30),
            child: Text(
              'Todays schedule',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
              child: widget.selectedDay == 0
                  ? ListView.builder(
                      itemCount: widget.schedule.sunday!.ksc!.meals!.length,
                      itemBuilder: (context, index) {
                        return customRadioListTile(
                            index,
                            Text(widget.schedule.sunday!.ksc!.meals![index].meal
                                .toString()));
                      },
                    )
                  : widget.selectedDay == 1
                      ? ListView.builder(
                          itemCount:
                              widget.schedule.monday!.ksc!.meals!.length,
                          itemBuilder: (context, index) {
                            return customRadioListTile(
                                index,
                                Text(widget
                                    .schedule.monday!.ksc!.meals![index].meal
                                    .toString()));
                          })
                      : widget.selectedDay == 2
                          ? ListView.builder(
                              itemCount: widget
                                  .schedule.tuesday!.ksc!.meals!.length,
                              itemBuilder: (context, index) {
                                return customRadioListTile(
                                    index,
                                    Text(widget
                                        .schedule.tuesday!.ksc!.meals![index].meal
                                        .toString()));
                              })
                          : widget.selectedDay == 3
                              ? ListView.builder(
                                  itemCount: widget.schedule.wednesday!.ksc!
                                      .meals!.length,
                                  itemBuilder: (context, index) {
                                    return customRadioListTile(
                                        index,
                                        Text(widget.schedule.wednesday!.ksc!
                                            .meals![index].meal
                                            .toString()));
                                  })
                              : widget.selectedDay == 4
                                  ? ListView.builder(
                                      itemCount: widget.schedule.thursday!
                                          .ksc!.meals!.length,
                                      itemBuilder: (context, index) {
                                        return Text(widget.schedule.thursday!
                                            .ksc!.meals![index].meal
                                            .toString());
                                      })
                                  : widget.selectedDay == 5
                                      ? Container()
                                      : Container()),
          Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ElevatedButton(
                  onPressed: () => _submit(_selectedIndex),
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.7, 50),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child:  Text(
                    'submit',
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              )),
          Text(selectedChoice)
        ],
      ),
    );
  }

  Widget customRadioListTile(index, text) {
    return RadioListTile(
      dense: true,
      activeColor: Theme.of(context).primaryColor,
      controlAffinity: ListTileControlAffinity.leading,
      title: text,
      value: index,
      groupValue: _selectedIndex,
      onChanged: (value) {
        setState(() {
          _selectedIndex = value!;
        });
      },
    );
  }
}
