import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllOrders(
      [String? restaurant, DateTime? ordersDate]);
  Future<Either<FirebaseFailure, Unit>> addOrder(
      OrderEntity orderEntity, String restaurant);
  Future<Either<FirebaseFailure, Unit>> deleteOrder(String restaurant);
}
