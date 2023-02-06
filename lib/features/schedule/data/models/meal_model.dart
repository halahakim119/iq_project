import 'package:iq_project/features/schedule/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  const MealModel({int? id, String? meal}) : super(id: id, meal: meal);
  MealModel copyWith({int? id, String? meal}) {
    return MealModel(id: id ?? this.id, meal: meal ?? this.meal);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'meal': meal};
  }

  factory MealModel.fromJson(Map<String, Object?> json) {
    return MealModel(
        id: json['id'] == null ? null : json['id'] as int,
        meal: json['meal'] == null ? null : json['meal'] as String);
  }

  @override
  String toString() {
    return '''MealModel(
                id:$id,
meal:$meal
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is MealModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.meal == meal;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, meal);
  }
}
