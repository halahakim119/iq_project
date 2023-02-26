import 'package:dartz/dartz.dart';
import 'package:iq_project/features/Kitchen/schedule_management/domain/repositories/schedule_management_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart';

class DeleteMealUsecase {
  final ScheduleManagementRepository repository;

  DeleteMealUsecase(this.repository);

  Future<Either<FirebaseFailure, Unit>> call(
      String mealId, int dayIndex) async {
    try {
      final result = await repository.deleteMeal(mealId, dayIndex);
      return result.fold((failure) => Left(failure), (_) => const Right(unit));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
