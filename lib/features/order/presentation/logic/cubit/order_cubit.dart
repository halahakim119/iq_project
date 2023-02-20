import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/injection/injection_container.dart';
import '../../../data/models/order_model.dart';
import '../../../domain/usecases/order_usecase.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final ordersRef = sl<DatabaseReference>();
  final OrderUseCase orderUseCase;
  OrderCubit({required this.orderUseCase}) : super(const OrderState.loading());

  void order(OrderModel parameters) async {
    emit(const OrderState.loading());
    try {
      await ordersRef
          .child(parameters.department!)
          .push()
          .set(parameters.toJson());
      emit(const OrderState.loaded());
    } catch (e) {
      emit(OrderState.error(e.toString()));
    }
  }
}
