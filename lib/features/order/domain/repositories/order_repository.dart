import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Either<FirebaseFailure, String>> order(OrderEntity parameters);
  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, String department);
}
