part of 'add_delete_order_bloc.dart';

abstract class AddDeleteOrderState extends Equatable {
  const AddDeleteOrderState();

  @override
  List<Object> get props => [];
}

class AddDeleteOrderInitial extends AddDeleteOrderState {}

class LoadingAddDeleteOrderState extends AddDeleteOrderState {
  final bool isLoading;

  const LoadingAddDeleteOrderState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class LoadedAddDeleteOrderState extends AddDeleteOrderState {
  final Map<String, dynamic> Orders;

  LoadedAddDeleteOrderState({required this.Orders});

  @override
  List<Object> get props => [Orders];
}

class ErrorAddDeleteOrderState extends AddDeleteOrderState {
  final String message;

  ErrorAddDeleteOrderState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteOrderState extends AddDeleteOrderState {
  final String message;

  MessageAddDeleteOrderState({required this.message});

  @override
  List<Object> get props => [message];
}
