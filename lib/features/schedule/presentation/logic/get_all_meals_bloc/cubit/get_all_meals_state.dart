part of 'get_all_meals_cubit.dart';

@freezed
class GetAllMealsState with _$GetAllMealsState {
  const factory GetAllMealsState.getAllMealsInitial() = _GetAllMealsInitial;
  const factory GetAllMealsState.loadingGetAllMealsState() =
      _LoadingGetAllMealsState;
  const factory GetAllMealsState.loadedGetAllMealsState(
      Map<String, dynamic> meals) = _LoadedGetAllMealsState;
  const factory GetAllMealsState.errorGetAllMealsState(String message) =
      _ErrorGetAllMealsState;
}
