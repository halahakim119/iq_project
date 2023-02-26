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
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals();
  Future<Either<FirebaseFailure, Unit>> deleteMeal(String mealId, int dayIndex);
  Future<Either<FirebaseFailure, Unit>> addMeal(String meal, int dayIndex);
}

class ScheduleManagementDataSourceImpl implements ScheduleManagementDataSource {
  DatabaseReference scheduleRef =
      FirebaseDatabase.instance.reference().child('schedule_management');
  late StreamSubscription _onChildAddedSubscription;
  late StreamSubscription _onChildRemovedSubscription;

  @override
  Future<Either<FirebaseFailure, Unit>> addMeal(
      String meal, int dayIndex) async {
    try {
      var kitchenType = await getUserType();
      DatabaseReference restaurantRef = scheduleRef.child(kitchenType);
      DatabaseReference dayRef = restaurantRef.child('$dayIndex');
      DatabaseReference newMealRef = dayRef.push();
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
          .child('$mealId')
          .remove();
      return right(unit);
    } catch (e) {
      return left(FirebaseFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<FirebaseFailure, Map<String, dynamic>>> getAllMeals() async* {
    try {
      var kitchenType = await getUserType();
      scheduleRef =
          FirebaseDatabase.instance.reference().child('schedule_management');
      DatabaseReference kitchenRef = scheduleRef.child(kitchenType);

      final snapshot = await kitchenRef.once();
      final dataString = json.encode(snapshot.snapshot.value);

      Map<String, dynamic> data = json.decode(dataString);

      if (data.isNotEmpty) {
        _onChildAddedSubscription = kitchenRef.onChildAdded.listen((event) {
          data[event.snapshot.key!] = event.snapshot.value;
        });

        _onChildRemovedSubscription = kitchenRef.onChildRemoved.listen((event) {
          data.remove(event.snapshot.key);
        });
        yield right(data );
      } else {
        throw const NoDataAvailableException('No data available.');
      }
    } catch (e) {
      yield left(FirebaseFailure(message: e.toString()));
    }
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

  void dispose() {
    _onChildAddedSubscription.cancel();
    _onChildRemovedSubscription.cancel();
  }
}
