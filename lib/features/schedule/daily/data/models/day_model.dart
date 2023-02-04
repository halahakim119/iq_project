import 'package:iq_project/features/schedule/daily/domain/entities/day_entity.dart';

class DayModel extends DayEntity {
  const DayModel({List<dynamic>? ksc, List<dynamic>? awbara})
      : super(ksc: ksc, awbara: awbara);
      
  DayModel copyWith({List<dynamic>? ksc, List<dynamic>? awbara}) {
    return DayModel(ksc: ksc ?? this.ksc, awbara: awbara ?? this.awbara);
  }

  Map<String, Object?> toJson() {
    return {'ksc': ksc, 'awbara': awbara};
  }

  factory DayModel.fromJson(Map<String, Object?> json) {
    return DayModel(
        ksc: json['ksc'] == null ? null : json['ksc'] as List<String>,
        awbara: json['awbara'] == null ? null : json['awbara'] as List<String>);
  }

  @override
  String toString() {
    return '''Day(
                ksc:$ksc,
awbara:$awbara
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DayModel &&
        other.runtimeType == runtimeType &&
        other.ksc == ksc &&
        other.awbara == awbara;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, ksc, awbara);
  }
}
