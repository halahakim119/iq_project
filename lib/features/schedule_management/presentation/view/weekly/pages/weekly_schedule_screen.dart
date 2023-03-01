import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection_container.dart';
import '../../../logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../widgets/weekly_schedule_widget.dart';

class WeeklyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<GetAllMealsCubit>(),
        child: BlocListener<GetAllMealsCubit, GetAllMealsState>(
            listener: (context, state) {},
            child: Builder(builder: (context) {
              final state = context.select<GetAllMealsCubit, GetAllMealsState>(
                (cubit) => cubit.state,
              );
              return state.when(
                  getAllMealsInitial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loadingGetAllMealsState: () =>
                      const Center(child: CircularProgressIndicator()),
                  errorGetAllMealsState: (message) => Center(
                        child: Text('Error loading meals $message'),
                      ),
                  loadedGetAllMealsState: (meals) => WeeklySchedulaWidget(
                      kscSchedule: meals['ksc'],
                      awbaraSchedule: meals['awbara']));
            })));
  }
}
