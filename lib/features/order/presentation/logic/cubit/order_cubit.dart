import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/order_model.dart';
import '../../../domain/usecases/order_usecase.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderUseCase orderUseCase;
  OrderCubit({required this.orderUseCase}) : super(const OrderState.loading());

  Future<void> order(OrderModel parameters) async {
    emit(const OrderState.loading());

    final result = await orderUseCase.call(parameters);
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (id) => emit(OrderState.loaded(id)),
    );
  }

  Future<void> deleteOrder(String orderId, String department) async {
    emit(const OrderState.loading());
    final result = await orderUseCase.deleteOrder(orderId, department);
    result.fold(
      (failure) => emit(OrderState.error(failure.message)),
      (_) => emit(OrderState.loaded(department)),
    );
  }
}
