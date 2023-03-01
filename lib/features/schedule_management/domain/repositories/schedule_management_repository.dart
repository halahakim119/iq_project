import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class ScheduleManagementRepository {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals();
  Future<Either<FirebaseFailure, Unit>> addMeal(String meal, int dayIndex);
  Future<Either<FirebaseFailure, Unit>> deleteMeal(String mealId, int dayIndex);
}
