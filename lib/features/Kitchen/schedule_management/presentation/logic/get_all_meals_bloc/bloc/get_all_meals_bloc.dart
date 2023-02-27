import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

        final stream = getAllMealsUsecase();
        addDeleteMealSubscription?.cancel();
        addDeleteMealSubscription = addDeleteMealBloc.stream.listen((state) {
          if (state is MessageAddDeleteMealState) {
            add(GetMealsEvent());
          }
        });
        stream.listen((either) {
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
}
