import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';

abstract class OrderDataSource {
  Future<Either<Failure, Unit>> order(OrderEntity parameters);
}

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<Either<Failure, Unit>> order(OrderEntity parameters) async {
    OrderModel orderModel = OrderModel(
      mealID: parameters.mealID,
      restaurantID: parameters.restaurantID,
      department: parameters.department,
    );

    try {
      DatabaseReference ordersRef =
          FirebaseDatabase.instance.reference().child('orders');
      DatabaseReference departmentRef =
          ordersRef.child('${orderModel.department!}');

      // Save the order data in the database
      await departmentRef.push().set(orderModel.toJson());

      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
