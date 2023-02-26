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

  const LoadedGetAllMealsState({required this.meals});

  @override
  List<Object> get props => [meals];
}

class ErrorGetAllMealsState extends GetAllMealsState {
  final String message;

  const ErrorGetAllMealsState({required this.message});

  @override
  List<Object> get props => [message];
}

class MealsUpdatedState extends GetAllMealsState {
  final Map<String, dynamic> meals;

  const MealsUpdatedState({required this.meals});

  @override
  List<Object> get props => [meals];
}
