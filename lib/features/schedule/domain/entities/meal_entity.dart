import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final int? id;
  final String? meal;
  const MealEntity({this.id, this.meal});

  @override
  List<Object?> get props => [id, meal];
}
