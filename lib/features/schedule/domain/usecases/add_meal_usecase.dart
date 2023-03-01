import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart';
import '../repositories/schedule_management_repository.dart';

class AddMealUsecase {
  final ScheduleManagementRepository repository;
  AddMealUsecase(this.repository);
  Future<Either<FirebaseFailure, Unit>> call(String meal, int dayIndex) async {
    try {
      final result = await repository.addMeal(meal, dayIndex);
      return result.fold((failure) => Left(failure), (_) => const Right(unit));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
