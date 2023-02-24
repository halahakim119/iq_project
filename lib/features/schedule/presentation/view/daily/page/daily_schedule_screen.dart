import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/custom_loading.dart';
import '../../../../../splash/splash_404.dart';
import '../../../logic/cubit/schedule_cubit.dart';
import '../widgets/daily_schedule_widget.dart';
import '../widgets/food_state.dart';
import '../widgets/weekend_widget.dart';

class DailyScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int day = DateTime.now().weekday;
    int hour = DateTime.now().hour;

    return (day == 5 || day == 6)
        ? WeekendWidget()
        : (hour >= 9 && hour < 10)
            ? SingleChildScrollView(
                child: BlocBuilder<ScheduleCubit, ScheduleState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const CustomLoading(),
                      loaded: (schedule) =>
                          DailyScheduleWidget(schedule: schedule),
                      error: (error) => Splash404(error: error),
                    );
                  },
                ),
              )
            : const FoodState();
  }
}
