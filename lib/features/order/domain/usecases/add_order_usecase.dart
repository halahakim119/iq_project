import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../entities/order_entity.dart';
import '../repositories/order_repository.dart';

class AddOrderUsecase {
  final OrderRepository repository;
  AddOrderUsecase(this.repository);
  Future<Either<FirebaseFailure, Unit>> call(OrderEntity orderEntity,String restaurant) async {
    try {
      final result = await repository.addOrder(orderEntity,restaurant);
      return result.fold((failure) => Left(failure), (_) => const Right(unit));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
