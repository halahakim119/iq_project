import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

import '../../../../../core/error/failure.dart';
import '../../../profile/data/datasource/user_data_source.dart';
import '../models/order_model.dart';

abstract class OrdersDataSource {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      [String? restaurant, DateTime? ordersDate]);
  Future<Either<FirebaseFailure, Unit>> deleteOrder(String restaurant);
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
    ordersRef.onValue.listen((event) async {
      final data = event.snapshot.value;
      if (data != null) {
        final dataString = json.encode(data);
        Map<String, dynamic> dataValues = json.decode(dataString);
        var userType = await UserDataSource.getUserType();
        userType.fold((l) => null, (type) {
          if (type == 'hq') {
            return right(dataValues);
          } else {
            dataValues.forEach((key, value) {
              key == type ? dataValues = value : null;
            });
          }
        });
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
      String monthYear = date.split('/').reversed.join('-');

      DatabaseReference restaurantRef = ordersRef.child(restaurant);
      DatabaseReference dateRef = restaurantRef.child(monthYear);

      DatabaseReference newMealRef = dateRef.push();
      await newMealRef.set(orderModel.toJson());

      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteOrder(String restaurant) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return Left(FirebaseFailure(message: 'current User is null'));
      }

      final now = DateTime.now();
      final monthYear = DateFormat('yyyy-M').format(now);

      final ordersRef = FirebaseDatabase.instance
          .ref()
          .child('orders')
          .child(restaurant)
          .child(monthYear);

      final ordersSnapshot = await ordersRef.get();

      if (ordersSnapshot.exists) {
        final dataString = json.encode(ordersSnapshot.value);
        Map<String, dynamic> orderIds = json.decode(dataString);

        for (final orderId in orderIds.keys) {
          final orderData = Map<String, dynamic>.from(orderIds[orderId]);
          if (orderData['user_email'] == currentUser.email &&
              orderData['order_date'] == DateFormat('yyyy-MM-dd').format(now)) {
            final orderRef = ordersRef.child(orderId);
            await orderRef.remove();
          }
        }
      }
      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      [String? restaurant, DateTime? ordersDate]) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return Left(FirebaseFailure(message: 'current User is null'));
      }
      var userType = await UserDataSource.getUserType();
      var data =
          await FirebaseDatabase.instance.reference().child('orders').get();
      final dataString = json.encode(data.value);
      Map<String, dynamic> dataValues = json.decode(dataString);
      if (data.exists) {
        userType.fold((l) => null, (type) {
          if (type == 'hq') {
            return right(dataValues);
          } else if (type == 'normal') {
            var orders = dataValues[restaurant]
                [DateFormat('yyyy-M').format(ordersDate!)];
            for (final orderId in orders.keys) {
              final orderData = Map<String, dynamic>.from(orders[orderId]);
              if (orderData['user_email'] == currentUser.email &&
                  orderData['order_date'] ==
                      DateFormat('yyyy-MM-dd').format(ordersDate)) {
                final orderRef = ordersRef.child(orderId);
                final dataString = json.encode(orderRef);
                Map<String, dynamic> dataValues = json.decode(dataString);
                return right(dataValues);
              }
            }
          } else {
            dataValues.forEach((key, value) {
              key == type ? dataValues = value : null;
            });

            return right(dataValues);
          }
        });
      }
      return right(dataValues);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onOrdersChanged() =>
      _controller.stream;
}
