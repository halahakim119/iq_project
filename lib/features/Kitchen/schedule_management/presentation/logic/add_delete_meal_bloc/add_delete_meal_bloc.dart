import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/failure.dart';
import '../../../domain/usecases/add_meal_usecase.dart';
import '../../../domain/usecases/delete_meal_usecase.dart';

part 'add_delete_meal_event.dart';
part 'add_delete_meal_state.dart';

class AddDeleteMealBloc extends Bloc<AddDeleteMealEvent, AddDeleteMealState> {
  final AddMealUsecase addMealUsecase;
  final DeleteMealUsecase deleteMealUsecase;

  AddDeleteMealBloc(
      {required this.addMealUsecase, required this.deleteMealUsecase})
      : super(AddDeleteMealInitial());

  @override
  Stream<AddDeleteMealState> mapEventToState(AddDeleteMealEvent event) async* {
    if (event is AddMealEvent) {
      yield LoadingAddDeleteMealState();

      final failureOrDoneMessage =
          await addMealUsecase(event.meal, event.dayIndex);

      yield _eitherDoneMessageOrErrorState(
        failureOrDoneMessage,
        'ADD_SUCCESS',
      );
    } else if (event is DeleteMealEvent) {
      yield LoadingAddDeleteMealState();

      final failureOrDoneMessage =
          await deleteMealUsecase(event.mealId, event.dayIndex);

      yield _eitherDoneMessageOrErrorState(
        failureOrDoneMessage,
        "DELETE_SUCCESS",
      );
    }
  }

  AddDeleteMealState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteMealState(
        message: _mapFailureToMessage(failure),
      ),
      (_) => MessageAddDeleteMealState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'SERVER_FAILURE';
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
