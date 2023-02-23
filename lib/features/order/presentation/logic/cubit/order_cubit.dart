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

    try {
      final result = await orderUseCase.call(parameters);
      result.fold(
        (failure) => emit(OrderState.error(failure.toString())),
        (id) => emit(OrderState.loaded(id)),
      );
    } catch (e) {
      emit(OrderState.error('Failed to submit order: $e'));
    }
  }

  Future<void> deleteOrder(String orderId, String department) async {
    emit(const OrderState.loading());
    try {
      await orderUseCase.deleteOrder(orderId, department);
      emit(OrderState.loaded(department));
    } catch (e) {
      emit(OrderState.error('Failed to delete order: $e'));
    }
  }
}
