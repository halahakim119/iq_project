import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../../schedule/presentation/view/weekly/widgets/day_button.dart';

class ScheduleManagementScreen extends StatefulWidget {
  const ScheduleManagementScreen({Key? key}) : super(key: key);

  @override
  _ScheduleManagementScreenState createState() =>
      _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen> {
  int selectedDay = 0;
  final List<String> scheduleItems = ['fries'];
  final TextEditingController _textController = TextEditingController();
  void onPressed(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  void _addItem(String newItem) {
    setState(() {
      scheduleItems.add(newItem);
    });
  }

  void _removeItem(int index) {
    setState(() {
      scheduleItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              thickness: 0.3 ,
            ),
            itemCount: scheduleItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "${index + 1} -",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () => _removeItem(index),
                ),
                title: Text(
                  scheduleItems[index],
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              );
            },
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 15,
              bottom: 25,
              right: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _textController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a meal description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        iconSize: 30,
                        color: Theme.of(context).colorScheme.primary,
                        icon: const Icon(UniconsThinline.arrow_circle_right),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(selectedDay);
                            print(_textController.text);
                            _addItem(_textController.text);
                            _textController.clear();
                          }
                        },
                      ),
                      hintText: 'Add a meal',
                      fillColor: Colors.transparent,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          width: 0.8,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
