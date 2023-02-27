import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart' as fb;
import '../../../../profile/data/models/user_model.dart';
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
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals() {
    return scheduleManagementDataSource.getAllMeals().map(
          (meals) => meals.fold(
            (failure) => Left(failure),
            (meals) => Right(meals),
          ),
        );
  }

  Future<String> getUserType() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('users/${currentUser!.uid}').get();

      if (snapshot.exists) {
        final dataString = json.encode(snapshot.value);

        Map<String, dynamic> data = json.decode(dataString);

        final userEntity = UserModel.fromFirebaseMap(data);
        if (userEntity.uType != null) {
          if (userEntity.uType == 'KSCKitchen') {
            return 'ksc';
          } else if (userEntity.uType == 'AwbaraKitchen') {
            return 'awbara';
          }
        }
      }
      return '';
    } catch (e) {
      throw fb.FirebaseException(message: e.toString());
    }
  }
}
