import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';

abstract class OrderDataSource {
  Future<Either<FirebaseFailure, String>> order(OrderEntity parameters);
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, String department);
}

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<Either<FirebaseFailure, String>> order(OrderEntity parameters) async {
    OrderModel orderModel = OrderModel(
      mealID: parameters.mealID,
      restaurantID: parameters.restaurantID,
      department: parameters.department,
    );

    try {
      DatabaseReference ordersRef =
          FirebaseDatabase.instance.reference().child('orders');
      DatabaseReference departmentRef = ordersRef.child(orderModel.department);
      DatabaseReference newOrderRef = departmentRef.push();
      await newOrderRef.set(orderModel.toJson());
      String orderId = newOrderRef.key!;
      orderModel = OrderModel(
        id: orderId,
        mealID: parameters.mealID,
        restaurantID: parameters.restaurantID,
        department: parameters.department,
      );
      return Right(orderId);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, String department) async {
    try {
      DatabaseReference ordersRef =
          FirebaseDatabase.instance.reference().child('orders');
      DatabaseReference departmentRef = ordersRef.child(department);
      DatabaseReference orderRef = departmentRef.child(orderId);
      await orderRef.remove();
      return const Right(unit);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
