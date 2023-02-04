import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iq_project/features/schedule/daily/domain/usecases/get_schedule_usecase.dart';

import '../../../domain/entities/schedule_entity.dart';

part 'schedule_state.dart';
part 'schedule_cubit.freezed.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final GetScheduleUsecase getData;
  ScheduleCubit({required this.getData}) : super(const ScheduleState.loading());

  void fetchData() async {
    emit(const ScheduleState.loading());
    final failureOrSchedule = await getData();
    emit(failureOrSchedule.fold(
        (failure) => ScheduleState.error(failure.toString()),
        (data) => ScheduleState.loaded(data)));
  }
}
