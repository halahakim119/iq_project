import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../data/datasources/schedule_management_data_source.dart';
import '../../../../domain/usecases/get_all_meals_usecase.dart';

part 'get_all_meals_cubit.freezed.dart';
part 'get_all_meals_state.dart';

class GetAllMealsCubit extends Cubit<GetAllMealsState> {
  final ScheduleManagementDataSource scheduleManagementDataSource;
  final GetAllMealsUsecase getAllMealsUsecase;
  StreamSubscription<Either<FirebaseFailure, Map<String, dynamic>>>?
      _mealsSubscription;
  Map<String, dynamic> _previousMeals;

  GetAllMealsCubit({
    required this.scheduleManagementDataSource,
    required this.getAllMealsUsecase,
  })  : _previousMeals = {},
        super(const GetAllMealsState.getAllMealsInitial()) {
    _getMeals();
  }

  Future<void> _getMeals() async {
    emit(const GetAllMealsState.loadingGetAllMealsState());
    var result = await getAllMealsUsecase();
    result.fold(
      (failure) =>
          emit(GetAllMealsState.errorGetAllMealsState(failure.message)),
      (data) {
        _previousMeals = data;
        emit(GetAllMealsState.loadedGetAllMealsState(_previousMeals));
      },
    );

    _mealsSubscription?.cancel();
    _mealsSubscription = scheduleManagementDataSource.onMealsChanged().listen(
      (meals) {
        final newMeals = meals.getOrElse(() => _previousMeals);
        if (!mapEquals(newMeals, _previousMeals)) {
          _previousMeals = newMeals;
          emit(GetAllMealsState.loadedGetAllMealsState(_previousMeals));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _mealsSubscription?.cancel();
    return super.close();
  }
}
