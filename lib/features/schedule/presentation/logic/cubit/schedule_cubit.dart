import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/schedule_entity.dart';
import '../../../domain/usecases/get_schedule_usecase.dart';

part 'schedule_cubit.freezed.dart';
part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final GetScheduleUsecase getData;
  ScheduleCubit({required this.getData}) : super(const ScheduleState.loading());

  Future<void> fetchData() async {
    emit(const ScheduleState.loading());
    final failureOrSchedule = await getData();
    emit(failureOrSchedule.fold(
        (failure) => ScheduleState.error(failure.toString()),
        (data) => ScheduleState.loaded(data)));
  }
}
