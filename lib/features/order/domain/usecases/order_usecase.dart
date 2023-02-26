import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class OrderUseCase {
  final OrderRepository orderRepository;

  OrderUseCase({required this.orderRepository});

  Future<Either<FirebaseFailure, String>> call(OrderEntity parameters) async {
    return await orderRepository.order(parameters);
  }

  Future<Either<FirebaseFailure, Unit>> deleteOrder(
      String orderId, String department) async {
    return await orderRepository.deleteOrder(orderId, department);
  }
}
