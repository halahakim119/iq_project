import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/firebase_exceptions.dart' as fb;
import '../../../../../core/error/firebase_exceptions.dart';
import '../../../../profile/data/models/user_model.dart';

abstract class ScheduleManagementDataSource {
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals();
  Future<Either<FirebaseFailure, Unit>> deleteMeal(String mealId, int dayIndex);
  Future<Either<FirebaseFailure, Unit>> addMeal(String meal, int dayIndex);
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onMealsChanged();
}

class ScheduleManagementDataSourceImpl implements ScheduleManagementDataSource {
  DatabaseReference scheduleRef =
      FirebaseDatabase.instance.reference().child('schedule_management');
  final _controller =
      StreamController<Either<FirebaseFailure, Map<String, dynamic>>>();
  ScheduleManagementDataSourceImpl() {
    scheduleRef.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        final dataString = json.encode(data);
        Map<String, dynamic> dataValues = json.decode(dataString);

        _controller.add(Right(dataValues));
      } else {
        _controller.add(Left(FirebaseFailure(message: 'No data available.')));
      }
    });
  }
  @override
  Future<Either<FirebaseFailure, Unit>> addMeal(
      String meal, int dayIndex) async {
    try {
      var kitchenType = await getUserType();
      DatabaseReference restaurantRef = scheduleRef.child(kitchenType);
      DatabaseReference dayRef = restaurantRef.child('$dayIndex');
      DatabaseReference mealsRef = dayRef.child('meals');
      DatabaseReference newMealRef = mealsRef.push();

      await newMealRef.set(meal);
      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteMeal(
      String mealId, int dayIndex) async {
    try {
      var kitchenType = await getUserType();
      await FirebaseDatabase.instance
          .ref()
          .child('schedule_management')
          .child(kitchenType)
          .child('$dayIndex')
          .child('meals')
          .child(mealId)
          .remove();

      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals() async {
    try {
      var kitchenType = await getUserType();
      final data = await scheduleRef.get();
      if (data.exists) {
        final dataString = json.encode(data.value);
        Map<String, dynamic> dataValues = json.decode(dataString);

        return right(dataValues);
      } else {
        throw const NoDataAvailableException('No data available.');
      }
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> onMealsChanged() =>
      _controller.stream;

  Future<String> getUserType() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('users/${currentUser!.uid}').get();

      if (snapshot.exists) {
        final dataString = json.encode(snapshot.value);

        Map<String, dynamic> data = json.decode(dataString);

        final userEntity = UserModel.fromFirebaseMap(data);
        if (userEntity.uType.isNotEmpty) {
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
