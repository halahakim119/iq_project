import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;
  OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<Either<Failure, String>> order(OrderEntity parameters) async {
    final result = await orderDataSource.order(parameters);
    return result.fold((failure) => Left(failure), (id) async {
      return Right(id);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder(
      String orderId, String department) async {
    final result = await orderDataSource.deleteOrder(orderId, department);
    return result.fold((failure) => Left(failure), (_) {
      return const Right(unit);
    });
  }
}
