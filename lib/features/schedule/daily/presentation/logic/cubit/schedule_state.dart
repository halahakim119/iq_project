part of 'schedule_cubit.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.loading() = _Loading;
  const factory ScheduleState.loaded(ScheduleEntity schedule) = _Loaded;
  const factory ScheduleState.error(String error) = _Error;
}
