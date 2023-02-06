import '../../domain/entities/day_entity.dart';
import 'branch_model.dart';

class DayModel extends DayEntity {
  const DayModel({BranchModel? ksc, BranchModel? awbara})
      : super(ksc: ksc, awbara: awbara);

  Map<String, Object?> toJson() {
    BranchModel? ksc;
    BranchModel? awbara;
    return {'ksc': ksc?.toJson(), 'awbara': awbara?.toJson()};
  }

  factory DayModel.fromJson(Map<String, Object?> json) {
    return DayModel(
        ksc: json['ksc'] == null
            ? null
            : BranchModel.fromJson(json['ksc'] as Map<String, Object?>),
        awbara: json['awbara'] == null
            ? null
            : BranchModel.fromJson(json['awbara'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''DayModel(
                ksc:${ksc.toString()},
awbara:${awbara.toString()}
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
