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
      await orderUseCase.call(parameters);
      emit(const OrderState.loaded());
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }
}
