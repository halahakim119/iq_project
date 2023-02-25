import 'package:dartz/dartz.dart';

import 'package:iq_project/features/Kitchen/schedule_management/data/datasources/schedule_management_data_source.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/error/failure.dart';
import '../../domain/repositories/schedule_management_repository.dart';

class ScheduleManagementRepositoryImpl implements ScheduleManagementRepository {
  ScheduleManagementDataSource scheduleManagementDataSource;
  ScheduleManagementRepositoryImpl({
    required this.scheduleManagementDataSource,
  });
  @override
  Future<Either<Failure, Unit>> addMeal(String Meal, int dayIndex) async {
    try {
      await scheduleManagementDataSource.addMeal(Meal, dayIndex);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMeal(String id, int dayIndex) async {
    try {
      await scheduleManagementDataSource.deleteMeal(id, dayIndex);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAllMeals() async {
    try {
      final meals = await scheduleManagementDataSource.getAllMeals();
      return Right(meals);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
