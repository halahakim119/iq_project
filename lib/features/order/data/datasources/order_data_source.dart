import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/injection/injection_container.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';

abstract class OrderDataSource {
  Future<Either<Failure, Unit>> order(OrderEntity parameters);
}

class OrderDataSourceImpl implements OrderDataSource {
  final ordersRef = sl<DatabaseReference>();

  @override
  Future<Either<Failure, Unit>> order(OrderEntity parameters) async {
    OrderModel orderModel = OrderModel(
        mealID: parameters.mealID,
        restaurantID: parameters.restaurantID,
        department: parameters.department);

    try {
   
      // Save order details under the orders node
      await ordersRef.child('${orderModel.department}').push().set(orderModel.toJson());

      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
