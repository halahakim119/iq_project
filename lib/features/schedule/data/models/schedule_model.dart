import 'package:iq_project/features/schedule/domain/entities/schedule_entity.dart';

import 'day_model.dart';

class ScheduleModel extends ScheduleEntity {
  const ScheduleModel(
      {DayModel? sunday,
      DayModel? monday,
      DayModel? tuesday,
      DayModel? wednesday,
      DayModel? thursday})
      : super(
            sunday: sunday,
            monday: monday,
            tuesday: tuesday,
            wednesday: wednesday,
            thursday: thursday);

  Map<String, Object?> toJson() {
    DayModel? day;
    return {
      'sunday': day?.toJson(),
      'monday': day?.toJson(),
      'tuesday': day?.toJson(),
      'wednesday': day?.toJson(),
      'thursday': day?.toJson()
    };
  }

  static ScheduleModel fromJson(Map<String, Object?> json) {
    return ScheduleModel(
        sunday: json['sunday'] == null
            ? null
            : DayModel.fromJson(json['sunday'] as Map<String, Object?>),
        monday: json['monday'] == null
            ? null
            : DayModel.fromJson(json['monday'] as Map<String, Object?>),
        tuesday: json['tuesday'] == null
            ? null
            : DayModel.fromJson(json['tuesday'] as Map<String, Object?>),
        wednesday: json['wednesday'] == null
            ? null
            : DayModel.fromJson(json['wednesday'] as Map<String, Object?>),
        thursday: json['thursday'] == null
            ? null
            : DayModel.fromJson(json['thursday'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''ScheduleModel(
                sunday:${sunday.toString()},
monday:${monday.toString()},
tuesday:${tuesday.toString()},
wednesday:${wednesday.toString()},
thursday:${thursday.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ScheduleModel &&
        other.runtimeType == runtimeType &&
        other.sunday == sunday &&
        other.monday == monday &&
        other.tuesday == tuesday &&
        other.wednesday == wednesday &&
        other.thursday == thursday;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, sunday, monday, tuesday, wednesday, thursday);
  }
}
