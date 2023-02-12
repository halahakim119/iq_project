import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/schedule_entity.dart';

class DailyAwbaraContainer extends StatefulWidget {
  int selectedDay;

  ScheduleEntity schedule;
  DailyAwbaraContainer({
    required this.selectedDay,
    required this.schedule,
  });

  @override
  State<DailyAwbaraContainer> createState() => _DailyAwbaraContainerState();
}

class _DailyAwbaraContainerState extends State<DailyAwbaraContainer> {
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15, left: 30),
            child: AutoSizeText(
              'Todays schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.onTertiary),
            ),
          ),
          Expanded(
               child: widget.selectedDay == 0
                  ? CustomDailyMealsAwbara(widget.schedule.sunday!.awbara!.meals)
                  : widget.selectedDay == 1
                      ? CustomDailyMealsAwbara(widget.schedule.monday!.awbara!.meals)
                      : widget.selectedDay == 2
                          ? CustomDailyMealsAwbara(
                              widget.schedule.tuesday!.awbara!.meals)
                          : widget.selectedDay == 3
                              ? CustomDailyMealsAwbara(
                                  widget.schedule.wednesday!.awbara!.meals)
                              : widget.selectedDay == 4
                                  ? CustomDailyMealsAwbara(
                                      widget.schedule.thursday!.awbara!.meals)
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
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: AutoSizeText(
                    'submit',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background),
                  ),
                ),
              )),
          AutoSizeText(selectedChoice)
        ],
      ),
    );
  }
   Widget CustomDailyMealsAwbara(meals) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return customRadioListTile(
            index,
            AutoSizeText(meals[index].meal.toString(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary)));
      },
    );
  }


  Widget customRadioListTile(index, text) {
    return RadioListTile(
      dense: true,
      activeColor: Theme.of(context).colorScheme.onTertiary,
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