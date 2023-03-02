import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection_container.dart';
import '../../../logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../widgets/weekly_schedule_widget.dart';

class WeeklyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMealsCubit, GetAllMealsState>(
          builder: (context, state) {
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
    });
  }
}
