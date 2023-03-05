import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../models/order_model.dart';

abstract class OrdersDataSource {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      String restaurant, DateTime ordersDate);
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, DateTime orderDate, String restaurant);
  Future<Either<FirebaseFailure, Unit>> addOrder(
      OrderModel orderModel, String restaurant);
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onOrdersChanged();
}

class OrdersDataSourceImpl implements OrdersDataSource {
  DatabaseReference ordersRef =
      FirebaseDatabase.instance.reference().child('orders');
  final _controller =
      StreamController<Either<FirebaseFailure, Map<String, dynamic>>>();
  OrdersDataSourceImpl() {
    ordersRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        final dataString = json.encode(data);
        Map<String, dynamic> dataValues = json.decode(dataString);
        _controller.add(Right(dataValues));
      } else {
        _controller.add(Left(FirebaseFailure(message: 'No data available.')));
      }
    });
  }

  @override
  Future<Either<FirebaseFailure, Unit>> addOrder(
      OrderModel orderModel, String restaurant) async {
    try {
      String date = DateFormat.yM().format(orderModel.orderDate);

      DatabaseReference restaurantRef = ordersRef.child(restaurant);
      DatabaseReference dateRef = restaurantRef.child(date);
      DatabaseReference newMealRef = dateRef.push();
      await newMealRef.set(orderModel.toJson());

      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, DateTime orderDate, String restaurant) async {
    try {
      String date = DateFormat.yM().format(orderDate);

      await FirebaseDatabase.instance
          .ref()
          .child('orders')
          .child(restaurant)
          .child(date)
          .child(orderId)
          .remove();

      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      String restaurant, DateTime ordersDate) async {
    try {
      final data = await ordersRef.child(restaurant).child('$ordersDate').get();
      if (data.exists) {
        final dataString = json.encode(data.value);
        Map<String, dynamic> dataValues = json.decode(dataString);

        return right(dataValues);
      } else {
        throw const NoDataAvailableException('No data available.');
      }
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onOrdersChanged() =>
      _controller.stream;
}
