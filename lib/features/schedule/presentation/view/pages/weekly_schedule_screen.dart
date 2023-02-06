import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/schedule_cubit.dart';
import '../widgets/weekly_schedule_widget.dart';

class WeeklyScheduleScreen extends StatelessWidget {
  final appBarHeight = AppBar().preferredSize.height;

  final bottomNavigationBarHeight = 100;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height -
            (appBarHeight + bottomNavigationBarHeight),
        child: BlocBuilder<ScheduleCubit, ScheduleState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (schedule) => WeeklySchedulaWidget(schedule: schedule),
              error: (error) => Center(
                child: Text(error.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
