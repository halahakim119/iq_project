import 'package:dartz/dartz.dart';
import 'package:iq_project/features/Kitchen/schedule_management/domain/repositories/schedule_management_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart';

class GetAllMealsUsecase {
  final ScheduleManagementRepository repository;

  GetAllMealsUsecase(this.repository);

  Future<Either<FirebaseFailure, Map<String, dynamic>>> call() async {
    try {
      final meals = await repository.getAllMeals();
      return meals.fold((failure) => Left(failure), (meals) => Right(meals));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }
}
