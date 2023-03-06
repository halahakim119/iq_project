import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../widgets/daily_schedule_widget.dart';
import '../widgets/food_state.dart';
import '../widgets/weekend_widget.dart';

class DailyScheduleScreen extends StatefulWidget {
  @override
  _DailyScheduleScreenState createState() => _DailyScheduleScreenState();
}

class _DailyScheduleScreenState extends State<DailyScheduleScreen> {
  int _day = DateTime.now().weekday;
  int _hour = DateTime.now().hour;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        _day = DateTime.now().weekday;
        _hour = DateTime.now().hour;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_day == 5 || _day == 6)
        ? WeekendWidget()
        : (_hour >= 9 && _hour < 13)
            ? BlocBuilder<GetAllMealsCubit, GetAllMealsState>(
                builder: (context, state) {
                return state.when(
                    getAllMealsInitial: () =>
                        const Center(child: CircularProgressIndicator()),
                    loadingGetAllMealsState: () =>
                        const Center(child: CircularProgressIndicator()),
                    errorGetAllMealsState: (message) => Center(
                          child: Text('Error loading meals $message'),
                        ),
                    loadedGetAllMealsState: (meals) => DailyScheduleWidget(
                        kscSchedule: meals['ksc'],
                        awbaraSchedule: meals['awbara']));
              })
            : const FoodState();
  }
}
