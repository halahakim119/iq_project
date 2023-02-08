import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/custom_loading.dart';
import '../../../../../splash/splash_404.dart';
import '../../../logic/cubit/schedule_cubit.dart';
import '../widgets/weekly_schedule_widget.dart';

class WeeklyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return state.when(
            loading: () => const CustomLoading(),
            loaded: (schedule) => WeeklySchedulaWidget(schedule: schedule),
            error: (error) => Splash404(error: error),
          );
        },
      ),
    );
  }
}
