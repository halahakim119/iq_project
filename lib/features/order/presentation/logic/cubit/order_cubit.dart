import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/order_entity.dart';
import '../../../domain/usecases/order_usecase.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase orderUseCase;
  OrderCubit({required this.orderUseCase}) : super(const OrderState.loading());

  void order(OrderEntity parameters) async {
   
    emit(const OrderState.loading());
    final failureOrOrder = await orderUseCase(parameters);
    print(failureOrOrder);
    emit(failureOrOrder.fold((failure) => OrderState.error(failure.toString()),
        (_) => const OrderState.loaded()));
  }
}
