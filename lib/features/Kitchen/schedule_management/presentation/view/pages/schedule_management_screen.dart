import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_project/core/theme/custom_loading.dart';
import 'package:unicons/unicons.dart';

import '../../../../../../core/injection/injection_container.dart';
import '../../../../../schedule/presentation/view/weekly/widgets/day_button.dart';
import '../../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';
import '../../logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';

class ScheduleManagementScreen extends StatefulWidget {
  const ScheduleManagementScreen({Key? key}) : super(key: key);

  @override
  _ScheduleManagementScreenState createState() =>
      _ScheduleManagementScreenState();
}

class _ScheduleManagementScreenState extends State<ScheduleManagementScreen> {
  int selectedDay = 0;
  final TextEditingController _textController = TextEditingController();

  void onPressed(int index) {
    setState(() {
      selectedDay = index;
    });
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
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
          child: BlocProvider(
            create: (context) => sl<GetAllMealsCubit>(),
            child: BlocListener<GetAllMealsCubit, GetAllMealsState>(
              listener: (context, state) {},
              child: Builder(
                builder: (context) {
                  final state =
                      context.select<GetAllMealsCubit, GetAllMealsState>(
                    (cubit) => cubit.state,
                  );
                  return state.when(
                    getAllMealsInitial: () => const CircularProgressIndicator(),
                    loadingGetAllMealsState: () =>
                        const CircularProgressIndicator(),
                    loadedGetAllMealsState: (meals) => ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        thickness: 0.3,
                      ),
                      itemCount: meals['ksc'][selectedDay].values.length == 1
                          ? 1
                          : meals['ksc'][selectedDay]['meals'].values.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (meals['ksc'][selectedDay].values.length == 1) {
                          String message = 'no available data';
                          return Center(child: Text(message));
                        }
                        String mealId = meals['ksc'][selectedDay]['meals']
                            .keys
                            .toList()[index];
                        String mealName = meals['ksc'][selectedDay]['meals']
                            .values
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
                    ),
                    errorGetAllMealsState: (message) => Center(
                      child: Text('Error loading meals $message'),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 5,
              bottom: 15,
              right: 10,
            ),
            child: TextFormField(
              controller: _textController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a meal description';
                }
                return null;
              },
              decoration: InputDecoration(
                prefix: const SizedBox(
                  width: 10,
                ),
                hintText: 'Add a meal',
                hintStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                suffixIcon: IconButton(
                  iconSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                  icon: const Icon(UniconsThinline.arrow_circle_right),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await sl<AddDeleteMealBloc>()
                          .addMealUsecase(_textController.text, selectedDay);
                      _textController.clear();
                    }
                  },
                ),
                fillColor: Colors.transparent,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
