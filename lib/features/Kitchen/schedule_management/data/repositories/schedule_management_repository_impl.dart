import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart' as fb;
import '../../domain/repositories/schedule_management_repository.dart';
import '../datasources/schedule_management_data_source.dart';

class ScheduleManagementRepositoryImpl implements ScheduleManagementRepository {
  final ScheduleManagementDataSource scheduleManagementDataSource;

  ScheduleManagementRepositoryImpl({
    required this.scheduleManagementDataSource,
  });

  @override
  Future<Either<FirebaseFailure, Unit>> addMeal(
      String meal, int dayIndex) async {
    try {
      await scheduleManagementDataSource.addMeal(meal, dayIndex);
      return const Right(unit);
    } on fb.FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteMeal(
      String mealId, int dayIndex) async {
    try {
      final result =
          await scheduleManagementDataSource.deleteMeal(mealId, dayIndex);
      return result.fold((failure) {
        return Left(failure);
      }, (_) {
        return const Right(unit);
      });
    } on fb.FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    }
  }

  @override
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals() async {
    final meals = await scheduleManagementDataSource.getAllMeals();
    return meals.fold(
      (failure) {
        return Left(failure);
      },
      (meals) {
        return Right(meals);
      },
    );
  }
}
