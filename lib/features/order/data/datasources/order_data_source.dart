import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../../../../../core/error/failure.dart';
import '../models/order_model.dart';

abstract class OrdersDataSource {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      DateTime ordersDate);
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
      String orderDate = DateFormat.yM().format(orderModel.orderDate);
      DatabaseReference restaurantRef = ordersRef.child(restaurant);
      DatabaseReference dateRef = restaurantRef.child(orderDate);
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
      DateTime ordersDate) {
    // TODO: implement getAllOrders
    throw UnimplementedError();
  }

  @override
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onOrdersChanged() {
    // TODO: implement onOrdersChanged
    throw UnimplementedError();
  }
}
