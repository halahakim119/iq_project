import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../profile/data/models/user_model.dart';

abstract class ScheduleManagementDataSource {
  Future<Map<String, dynamic>> getAllMeals();
  Future<Unit> deleteMeal(String mealId, int dayIndex);
  Future<Unit> addMeal(String meal, int dayIndex);
}

class ScheduleManagementDataSourceImpl implements ScheduleManagementDataSource {
  DatabaseReference scheduleRef =
      FirebaseDatabase.instance.reference().child('schedule_management');
  @override
  Future<Unit> addMeal(String meal, int dayIndex) async {
    var kitchenType = await getUserType();
    DatabaseReference restaurantRef = scheduleRef.child(kitchenType);
    DatabaseReference dayRef = restaurantRef.child('$dayIndex');
    DatabaseReference newMealRef = dayRef.push();
    await newMealRef.set(meal);
    return unit;
  }

  @override
  Future<Unit> deleteMeal(String mealId, int dayIndex) async {
    var kitchenType = await getUserType();
    FirebaseDatabase.instance
        .ref()
        .child('schedule_management')
        .child(kitchenType)
        .child('$dayIndex')
        .child('$mealId')
        .remove();
    return unit;
  }

  @override
  Future<Map<String, dynamic>> getAllMeals() async {
    var kitchenType = await getUserType();
    final data = await scheduleRef.get();
    if (data.exists) {}
    final dataString = json.encode(data.value);
    Map<String, dynamic> dataValues = json.decode(dataString);
    print(dataValues);
    return dataValues;
  }

  Future<String> getUserType() async {
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
  }
}
