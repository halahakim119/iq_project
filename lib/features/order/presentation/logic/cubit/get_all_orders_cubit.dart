import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/datasources/order_data_source.dart';
import '../../../domain/usecases/get_all_orders_usecase.dart';

part 'get_all_orders_cubit.freezed.dart';
part 'get_all_orders_state.dart';

class GetAllOrdersCubit extends Cubit<GetAllOrdersState> {
  final OrdersDataSource ordersDataSource;
  final GetAllOrdersUsecase getAllOrdersUsecase;
  StreamSubscription<Either<FirebaseFailure, Map<String, dynamic>>>?
      _OrdersSubscription;
  Map<String, dynamic> _previousOrders;
  GetAllOrdersCubit(
      {required this.ordersDataSource, required this.getAllOrdersUsecase})
      : _previousOrders = {},
        super(const GetAllOrdersState.getAllOrdersInitial());

  Future<void> _getOrders(String restaurant, DateTime ordersDate) async {
    emit(const GetAllOrdersState.loadingGetAllOrdersState());
    var result = await getAllOrdersUsecase(restaurant, ordersDate);
    result.fold(
      (failure) =>
          emit(GetAllOrdersState.errorGetAllOrdersState(failure.message)),
      (data) {
        _previousOrders = data;
        emit(GetAllOrdersState.loadedGetAllOrdersState(_previousOrders));
      },
    );

    _OrdersSubscription?.cancel();
    _OrdersSubscription = ordersDataSource.onOrdersChanged().listen(
      (orders) {
        final newOrders = orders.getOrElse(() => _previousOrders);
        if (!mapEquals(newOrders, _previousOrders)) {
          _previousOrders = newOrders;
          emit(GetAllOrdersState.loadedGetAllOrdersState(_previousOrders));
        }
      },
    );
  }

  void fetchOrders(String restaurant, DateTime ordersDate) {
    _getOrders(restaurant, ordersDate);
  }

  @override
  Future<void> close() {
    _OrdersSubscription?.cancel();
    return super.close();
  }
}
