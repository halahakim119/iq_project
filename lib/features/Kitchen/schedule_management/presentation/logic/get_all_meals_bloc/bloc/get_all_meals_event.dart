part of 'get_all_meals_bloc.dart';


abstract class GetAllMealsEvent extends Equatable {
  const GetAllMealsEvent();

  @override
  List<Object> get props => [];
}

class GetMealsEvent extends GetAllMealsEvent {}

class RefreshMealsEvent extends GetAllMealsEvent {}