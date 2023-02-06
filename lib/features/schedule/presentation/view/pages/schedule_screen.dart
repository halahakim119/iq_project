// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../logic/cubit/schedule_cubit.dart';
import '../widgets/daily_schedule_widget.dart';
import '../widgets/weekly_schedule_widget.dart';

class ScheduleScreen extends StatelessWidget {
  final String dailyOrWeekly;
  ScheduleScreen({
    required this.dailyOrWeekly,
  });
  final appBarHeight = AppBar().preferredSize.height;

  final bottomNavigationBarHeight = 100;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<ScheduleCubit>()..fetchData(),
      child: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height -
              (appBarHeight + bottomNavigationBarHeight),
          child: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
              return state.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (schedule) => dailyOrWeekly == "daily"
                      ? DailyScheduleWidget(schedule: schedule)
                      : dailyOrWeekly == "weekly"
                          ? WeeklySchedulaWidget(schedule: schedule)
                          : Container(),
                  error: (error) => Center(
                        child: Text(error.toString()),
                      ));
            },
          ),
        ),
      ),
    );
  }
}
