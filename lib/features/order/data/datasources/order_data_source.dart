import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';
import '../models/order_model.dart';

abstract class OrderDataSource {
  Future<Either<Failure, String>> order(OrderEntity parameters);
  Future<Either<Failure, Unit>> deleteOrder(String orderId, String department);
}

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<Either<Failure, String>> order(OrderEntity parameters) async {
    OrderModel orderModel = OrderModel(
      mealID: parameters.mealID,
      restaurantID: parameters.restaurantID,
      department: parameters.department,
    );

    try {
      DatabaseReference ordersRef =
          FirebaseDatabase.instance.reference().child('orders');
      DatabaseReference departmentRef =
          ordersRef.child('${orderModel.department}');

      // Push a new child node and set the data for that node
      DatabaseReference newOrderRef = departmentRef.push();
      await newOrderRef.set(orderModel.toJson());

      // Retrieve the auto-generated key for the new child node
      String orderId = newOrderRef.key!;
      orderModel = OrderModel(
        id: orderId,
        mealID: parameters.mealID,
        restaurantID: parameters.restaurantID,
        department: parameters.department,
      );

      return Right(orderId);
    } catch (e, stackTrace) {
      print('Error while ordering: $e\n$stackTrace');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder(
      String orderId, String department) async {
    try {
      DatabaseReference ordersRef =
          FirebaseDatabase.instance.reference().child('orders');

      DatabaseReference departmentRef = ordersRef.child(department);
      // Get a reference to the order to be deleted
      DatabaseReference orderRef = departmentRef.child(orderId);

      // Remove the order
      await orderRef.remove();

      // FirebaseDatabase.instance.ref().child('orders').child('HR').child('-NOnSt1Khb48Tfh0DfKE').remove();

      return const Right(unit);
    } catch (e) {
      print(e.toString());
      return Left(ServerFailure());
    }
  }
}
