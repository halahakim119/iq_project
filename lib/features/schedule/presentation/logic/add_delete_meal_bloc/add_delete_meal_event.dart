part of 'add_delete_meal_bloc.dart';

abstract class AddDeleteMealEvent extends Equatable {
  const AddDeleteMealEvent();

  @override
  List<Object> get props => [];
}

class AddMealEvent extends AddDeleteMealEvent {
  final String meal;
  final int dayIndex;

  AddMealEvent({required this.meal, required this.dayIndex});

  @override
  List<Object> get props => [meal, dayIndex];
}

class DeleteMealEvent extends AddDeleteMealEvent {
  final String mealId;
  final int dayIndex;

  DeleteMealEvent({required this.mealId, required this.dayIndex});

  @override
  List<Object> get props => [mealId, dayIndex];
}
