import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../repositories/schedule_management_repository.dart';

class GetAllMealsUsecase {
  final ScheduleManagementRepository repository;

  GetAllMealsUsecase(this.repository);

  Stream<Either<FirebaseFailure, Map<String, dynamic>>> call() async* {
    final meals = repository.getAllMeals();
    meals
        .map((either) =>
            either.fold((failure) => Left(failure), (meals) => Right(meals)))
        .handleError(
            (e) => Stream.value(Left(FirebaseFailure(message: e.toString()))));
  }
}
