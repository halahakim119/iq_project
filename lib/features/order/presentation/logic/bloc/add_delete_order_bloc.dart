import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart';
import '../../../domain/entities/order_entity.dart';
import '../../../domain/usecases/add_order_usecase.dart';
import '../../../domain/usecases/delete_order_usecase.dart';

part 'add_delete_order_event.dart';
part 'add_delete_order_state.dart';

class AddDeleteOrderBloc
    extends Bloc<AddDeleteOrderEvent, AddDeleteOrderState> {
  final AddOrderUsecase addOrderUsecase;
  final DeleteOrderUsecase deleteOrderUsecase;

  AddDeleteOrderBloc({
    required this.addOrderUsecase,
    required this.deleteOrderUsecase,
  }) : super(AddDeleteOrderInitial()) {
    on<AddOrderEvent>((event, emit) async {
      emit(const LoadingAddDeleteOrderState(isLoading: true));

      try {
        final failureOrDoneMessage =
            await addOrderUsecase(event.orderEntity, event.restaurant);
        emit(_eitherDoneMessageOrErrorState(
          failureOrDoneMessage,
          'Order added successfully.',
        ));
      } on FirebaseException catch (e) {
        emit(ErrorAddDeleteOrderState(message: e.message));
      }
    });
    on<DeleteOrderEvent>((event, emit) async {
      emit(const LoadingAddDeleteOrderState(isLoading: true));

      try {
        final failureOrDoneMessage = await deleteOrderUsecase(
            event.orderId, event.orderDate, event.restaurant);
        emit(_eitherDoneMessageOrErrorState(
          failureOrDoneMessage,
          "Order deleted successfully.",
        ));
      } on FirebaseException catch (e) {
        emit(ErrorAddDeleteOrderState(message: e.message));
      }
    });
  }

  AddDeleteOrderState _eitherDoneMessageOrErrorState(
      Either<FirebaseFailure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorAddDeleteOrderState(
        message: failure.message,
      ),
      (_) => MessageAddDeleteOrderState(
        message: message,
      ),
    );
  }
}
