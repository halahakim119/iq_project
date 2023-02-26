import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource orderDataSource;
  OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<Either<FirebaseFailure, String>> order(OrderEntity parameters) async {
    try {
      final id = await orderDataSource.order(parameters);
      return id.fold((failure) {
        return Left(failure);
      }, (id) {
        return Right(id);
      });
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, String department) async {
    try {
      final result = await orderDataSource.deleteOrder(orderId, department);
      return result.fold((failure) {
        return Left(failure);
      }, (_) {
        return const Right(unit);
      });
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
