import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class OrderUseCase {
  final OrderRepository orderRepository;

  OrderUseCase({required this.orderRepository});

  Future<Either<Failure, Unit>> call(OrderEntity parameters) async {
    return await orderRepository.order(parameters);
  }
}
