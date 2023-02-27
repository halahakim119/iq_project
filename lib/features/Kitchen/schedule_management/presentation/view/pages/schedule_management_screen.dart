import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../../../../schedule/presentation/view/weekly/widgets/day_button.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';
import '../../logic/get_all_meals_bloc/bloc/get_all_meals_bloc.dart';
import '../widgets/cutsom_text_field.dart';

class ScheduleManagementScreen extends StatefulWidget {
  const ScheduleManagementScreen({Key? key}) : super(key: key);

  @override
  _ScheduleManagementScreenState createState() =>
      _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen> {
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
        Expanded(
            child: BlocProvider(
          create: (context) => sl<GetAllMealsBloc>()..add(GetMealsEvent()),
          child: BlocBuilder<GetAllMealsBloc, GetAllMealsState>(
            builder: (context, state) {
              if (state is LoadingGetAllMealsState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorGetAllMealsState) {
                return Center(child: Text(state.message));
              } else if (state is LoadedGetAllMealsState) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 0.3,
                  ),
                  itemCount: state.meals.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mealItems = state.meals.values.first;
                    
                    
                    print(mealItems);
                    String mealId = 'm';
                    String mealName = 'm';
                    // List<dynamic> mealItems = state.meals.values.toList();
                    // print(mealItems);

                    // mealItems = mealItems[0];

                    // String mealId = state.meals.keys.toList()[index];
                    // String mealName = mealItems[index].toString();

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
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () async {
                          await sl<AddDeleteMealBloc>()
                              .deleteMealUsecase(mealId, selectedDay);
                        },
                      ),
                      title: Text(
                        mealName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No meals found!'));
              }
            },
          ),
        )),
        CustomTextField(
          selectedDay: selectedDay,
        ),
      ],
    );
  }
}
