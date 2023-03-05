import 'dart:async';

import 'package:dartz/dartz.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../models/order_model.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrdersDataSource orderDataSource;
  OrderRepositoryImpl({required this.orderDataSource});

  @override
  Future<Either<FirebaseFailure, Unit>> addOrder(
      OrderEntity orderEntity, String restaurant) async {
    OrderModel orderModel = OrderModel(
        orderDate: orderEntity.orderDate,
        mealDes: orderEntity.mealDes,
        userEmail: orderEntity.userEmail,
        userDepartment: orderEntity.userDepartment);
    try {
      await orderDataSource.addOrder(orderModel, restaurant);
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, DateTime orderDate, String restaurant) async {
    try {
      final result =
          await orderDataSource.deleteOrder(orderId, orderDate, restaurant);
      return result.fold((failure) {
        return Left(failure);
      }, (_) {
        return const Right(unit);
      });
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      String restaurant, DateTime ordersDate) async {
    final meals = await orderDataSource.getAllOrders(restaurant, ordersDate);
    return meals.fold(
      (failure) {
        return Left(failure);
      },
      (meals) {
        return Right(meals);
      },
    );
  }
}
