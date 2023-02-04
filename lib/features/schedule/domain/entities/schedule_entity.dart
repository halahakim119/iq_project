import 'package:equatable/equatable.dart';
import 'package:iq_project/features/schedule/domain/entities/day_entity.dart';

class ScheduleEntity extends Equatable {
  final DayEntity? sunday;
  final DayEntity? monday;
  final DayEntity? tuesday;
  final DayEntity? wednesday;
  final DayEntity? thursday;
  const ScheduleEntity(
      {this.sunday, this.monday, this.tuesday, this.wednesday, this.thursday});
  @override
  List<Object?> get props => [sunday, monday, tuesday, wednesday, thursday];
}
