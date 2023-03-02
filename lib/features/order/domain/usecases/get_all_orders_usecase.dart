import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../repositories/order_repository.dart';

class GetAllOrdersUsecase {
  final OrderRepository repository;
  GetAllOrdersUsecase(this.repository);
  Future<Either<FirebaseFailure, Map<String, dynamic>>> call(
      DateTime ordersDate) async {
    try {
      final result = await repository.getAllOrders(ordersDate);
      return result.fold((failure) => Left(failure), (order) => Right(order));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
