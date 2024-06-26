part of 'add_delete_order_bloc.dart';

abstract class AddDeleteOrderEvent extends Equatable {
  const AddDeleteOrderEvent();

  @override
  List<Object> get props => [];
}

class AddOrderEvent extends AddDeleteOrderEvent {
  OrderEntity orderEntity;
  String restaurant;

  AddOrderEvent({required this.orderEntity, required this.restaurant});

  @override
  List<Object> get props => [orderEntity, restaurant];
}

class DeleteOrderEvent extends AddDeleteOrderEvent {
  String restaurant;

  DeleteOrderEvent({required this.restaurant});

  @override
  List<Object> get props => [restaurant];
}
