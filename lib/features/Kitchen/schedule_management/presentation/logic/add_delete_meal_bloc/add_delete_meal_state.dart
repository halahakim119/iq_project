part of 'add_delete_meal_bloc.dart';

abstract class AddDeleteMealState extends Equatable {
  const AddDeleteMealState();

  @override
  List<Object> get props => [];
}

class AddDeleteMealInitial extends AddDeleteMealState {}

class LoadingAddDeleteMealState extends AddDeleteMealState {}

class ErrorAddDeleteMealState extends AddDeleteMealState {
  final String message;

  ErrorAddDeleteMealState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteMealState extends AddDeleteMealState {
  final String message;

  MessageAddDeleteMealState({required this.message});

  @override
  List<Object> get props => [message];
}
