import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../../core/error/failure.dart';
import '../../../../domain/usecases/get_all_meals_usecase.dart';

part 'get_all_meals_event.dart';
part 'get_all_meals_state.dart';

class GetAllMealsBloc extends Bloc<GetAllMealsEvent, GetAllMealsState> {
  final GetAllMealsUsecase getAllMealsUsecase;
  GetAllMealsBloc({required this.getAllMealsUsecase})
      : super(GetAllMealsInitial()) {
    on<GetMealsEvent>((event, emit) async {
      if (event is GetMealsEvent) {
        emit(LoadingGetAllMealsState());

        final failureOrPosts = await getAllMealsUsecase();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshMealsEvent) {
        emit(LoadingGetAllMealsState());

        final failureOrPosts = await getAllMealsUsecase();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }
  GetAllMealsState _mapFailureOrPostsToState(
      Either<Failure, Map<String, dynamic>> either) {
    return either.fold(
      (failure) =>
          ErrorGetAllMealsState(message: _mapFailureToMessage(failure)),
      (meals) => LoadedGetAllMealsState(meals: meals),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE";

      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
