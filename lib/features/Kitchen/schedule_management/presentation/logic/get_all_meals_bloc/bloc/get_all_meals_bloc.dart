import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../domain/usecases/get_all_meals_usecase.dart';
import '../../add_delete_meal_bloc/add_delete_meal_bloc.dart';

part 'get_all_meals_event.dart';
part 'get_all_meals_state.dart';
class GetAllMealsBloc extends Bloc<GetAllMealsEvent, GetAllMealsState> {
  final GetAllMealsUsecase getAllMealsUsecase;
  final AddDeleteMealBloc addDeleteMealBloc;
  StreamSubscription? addDeleteMealSubscription;

  GetAllMealsBloc({
    required this.getAllMealsUsecase,
    required this.addDeleteMealBloc,
  }) : super(GetAllMealsInitial()) {
    on<GetAllMealsEvent>((event, emit) async {
      if (event is GetMealsEvent) {
        emit(LoadingGetAllMealsState());

        getAllMealsUsecase().listen((either) {
          final state = either.fold(
            (failure) => ErrorGetAllMealsState(message: failure.message),
            (meals) => LoadedGetAllMealsState(meals: meals),
          );
          emit(state);
        }, onError: (e) {
          emit(ErrorGetAllMealsState(message: e.toString()));
        });
      }
    });
  }

  @override
  Future<void> close() {
    addDeleteMealSubscription?.cancel();
    return super.close();
  }

  GetAllMealsState _mapFailureOrMealsToState(
      Either<FirebaseFailure, Map<String, dynamic>> either) {
    return either.fold(
      (failure) => ErrorGetAllMealsState(message: failure.message),
      (meals) => LoadedGetAllMealsState(meals: meals),
    );
  }
}
