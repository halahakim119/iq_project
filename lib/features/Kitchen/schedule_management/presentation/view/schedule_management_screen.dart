import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../../../core/injection/injection_container.dart';
import '../../../../../core/theme/custom_loading.dart';
import '../../../../schedule/presentation/view/weekly/widgets/day_button.dart';
import '../logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';
import '../logic/get_all_meals_bloc/bloc/get_all_meals_bloc.dart';

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

  Future<void> _onRefresh(BuildContext context) async {
    sl<GetAllMealsBloc>()..add(RefreshMealsEvent());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<GetAllMealsBloc>()..add(GetMealsEvent())),
        BlocProvider(create: (_) => sl<AddDeleteMealBloc>()),
      ],
      child: Column(
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
            child: BlocBuilder<GetAllMealsBloc, GetAllMealsState>(
              builder: (context, state) {
                if (state is LoadingGetAllMealsState) {
                  return const CustomLoading();
                } else if (state is LoadedGetAllMealsState) {
                  Map<String, dynamic> meals = state.meals['ksc'][selectedDay];
                  List<dynamic> mealItems = meals.values.toList();

                  return RefreshIndicator(
                    onRefresh: () async {
                      await _onRefresh(context);
                    
                    },
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        height: 1,
                        thickness: 0.3,
                      ),
                      itemCount: meals.length,
                      itemBuilder: (BuildContext context, int index) {
                        String mealId = meals.keys.toList()[index];
                        String mealName = mealItems[index].toString();

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
                            onPressed: () async {
                              await sl<AddDeleteMealBloc>()
                                  .deleteMealUsecase(mealId, selectedDay);
                          
                            },
                          ),
                          title: Text(
                            mealName,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is ErrorGetAllMealsState) {
                  return Center(child: Text(state.message));
                }
                return Container();
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
                              sl<AddDeleteMealBloc>().addMealUsecase(
                                  _textController.text, selectedDay);
                              sl<GetAllMealsBloc>().getAllMealsUsecase();
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
      ),
    );
  }
}
