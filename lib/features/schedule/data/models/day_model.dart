import '../../domain/entities/day_entity.dart';

class DayModel extends DayEntity {
  const DayModel({List<String>? ksc, List<String>? awbara})
      : super(ksc: ksc, awbara: awbara);

  DayModel copyWith({List<String>? ksc, List<String>? awbara}) {
    return DayModel(ksc: ksc ?? this.ksc, awbara: awbara ?? this.awbara);
  }

  Map<String, Object?> toJson() {
    return {'ksc': ksc, 'awbara': awbara};
  }

  factory DayModel.fromJson(Map<String, Object?> json) {
    return DayModel(
      ksc: json['ksc'] == null
          ? null
          : List<String>.from((json['ksc'] as List).map((x) => x.toString())),
      awbara: json['awbara'] == null
          ? null
          : List<String>.from(
              (json['awbara'] as List).map((x) => x.toString())),
    );
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
