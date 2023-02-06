import 'package:equatable/equatable.dart';
import 'package:iq_project/features/schedule/domain/entities/meal_entity.dart';

class BranchEntity extends Equatable {
  final int? id;
  final List<MealEntity>? meals;
  const BranchEntity({this.id, this.meals});

  @override
  List<Object?> get props => [id, meals];
}
