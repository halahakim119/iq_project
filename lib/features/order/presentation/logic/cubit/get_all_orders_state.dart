part of 'get_all_orders_cubit.dart';

@freezed
class GetAllOrdersState with _$GetAllOrdersState {
  const factory GetAllOrdersState.getAllOrdersInitial() = _GetAllOrdersInitial;
  const factory GetAllOrdersState.loadingGetAllOrdersState() =
      _LoadingGetAllOrdersState;
  const factory GetAllOrdersState.loadedGetAllOrdersState(
     Map<String, dynamic> Orders) = _LoadedGetAllOrdersState;
  const factory GetAllOrdersState.errorGetAllOrdersState(String message) =
      _ErrorGetAllOrdersState;
}
