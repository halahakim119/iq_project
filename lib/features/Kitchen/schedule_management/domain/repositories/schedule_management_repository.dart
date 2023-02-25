import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class ScheduleManagementRepository {
  Future<Either<Failure, Map<String, dynamic>>> getAllMeals();
  Future<Either<Failure, Unit>> addMeal(String Meal,int dayIndex);
  Future<Either<Failure, Unit>> deleteMeal(String id,int dayIndex);
}
