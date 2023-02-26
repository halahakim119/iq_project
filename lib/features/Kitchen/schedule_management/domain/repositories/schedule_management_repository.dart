import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class ScheduleManagementRepository {
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals();
  Future<Either<FirebaseFailure, Unit>> addMeal(String Meal, int dayIndex);
  Future<Either<FirebaseFailure, Unit>> deleteMeal(String mealid, int dayIndex);
}
