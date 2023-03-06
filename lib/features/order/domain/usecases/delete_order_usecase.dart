import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../repositories/order_repository.dart';

class DeleteOrderUsecase {
  final OrderRepository repository;
  DeleteOrderUsecase(this.repository);
  Future<Either<FirebaseFailure, Unit>> call(
       String restaurant) async {
    try {
      final result =
          await repository.deleteOrder( restaurant);
      return result.fold((failure) => Left(failure), (_) => const Right(unit));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
