import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/error/failure.dart';
import '../../../../../../core/error/firebase_exceptions.dart';
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
      yield const LoadingAddDeleteMealState(isLoading: true);
      try {
        final failureOrDoneMessage =
            await addMealUsecase(event.meal, event.dayIndex);

        yield _eitherDoneMessageOrErrorState(
          failureOrDoneMessage,
          'Meal added successfully.',
        );
      } on FirebaseException catch (e) {
        yield ErrorAddDeleteMealState(message: e.message);
      } catch (_) {
        yield ErrorAddDeleteMealState(message: 'An unknown error occurred.');
      }
    } else if (event is DeleteMealEvent) {
      yield const LoadingAddDeleteMealState(isLoading: true);
      try {
        final failureOrDoneMessage =
            await deleteMealUsecase(event.mealId, event.dayIndex);

        yield _eitherDoneMessageOrErrorState(
          failureOrDoneMessage,
          "Meal deleted successfully.",
        );
      } on FirebaseException catch (e) {
        yield ErrorAddDeleteMealState(message: e.message);
      } catch (_) {
        yield ErrorAddDeleteMealState(message: 'An unknown error occurred.');
      }
    }
  }

  AddDeleteMealState _eitherDoneMessageOrErrorState(
      Either<FirebaseFailure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteMealState(
        message: failure.message,
      ),
      (_) => MessageAddDeleteMealState(
        message: message,
      ),
    );
  }
}
