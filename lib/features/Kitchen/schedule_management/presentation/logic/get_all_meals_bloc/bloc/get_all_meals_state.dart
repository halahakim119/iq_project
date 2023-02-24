part of 'get_all_meals_bloc.dart';

abstract class GetAllMealsState extends Equatable {
  const GetAllMealsState();

  @override
  List<Object> get props => [];
}

class GetAllMealsInitial extends GetAllMealsState {}

class LoadingGetAllMealsState extends GetAllMealsState {}

class LoadedGetAllMealsState extends GetAllMealsState {
  final Map<String, dynamic> meals;

  LoadedGetAllMealsState({required this.meals});

  @override
  List<Object> get props => [meals];
}

class ErrorGetAllMealsState extends GetAllMealsState {
  final String message;

  ErrorGetAllMealsState({required this.message});

  @override
  List<Object> get props => [message];
}
