import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/schedule_cubit.dart';
import '../widgets/daily_schedule_widget.dart';

class DailyScheduleScreen extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (schedule) => DailyScheduleWidget(schedule: schedule),
            error: (error) => Center(
              child: Text(error.toString()),
            ),
          );
        },
      ),
    );
  }
}