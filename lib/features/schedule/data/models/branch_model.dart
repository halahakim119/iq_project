import 'package:iq_project/features/schedule/domain/entities/branch_entity.dart';

import 'meal_model.dart';

class BranchModel extends BranchEntity {
  const BranchModel({int? id, List<MealModel>? meals})
      : super(id: id, meals: meals);

  Map<String, Object?> toJson() {
    List<MealModel>? meals;
    return {
      'id': id,
      'meals':
          meals?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  factory BranchModel.fromJson(Map<String, Object?> json) {
    return BranchModel(
        id: json['id'] == null ? null : json['id'] as int,
        meals: json['meals'] == null
            ? null
            : (json['meals'] as List)
                .map<MealModel>(
                    (data) => MealModel.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''BranchModel(
                id:$id,
meals:${meals.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is BranchModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.meals == meals;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, meals);
  }
}
