import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../profile/data/models/user_model.dart';

class ScheduleRepository {
  DatabaseReference _scheduleRef =
      FirebaseDatabase.instance.reference().child('schedule');
  // Stream<List<ScheduleItem>> getSchedule() {
  //   return _scheduleRef.onValue.map((event) {
  //     List<ScheduleItem> items = [];
  //     if (event.snapshot.value != null) {
  //       event.snapshot.value!.forEach((key, value) {
  //         items.add(ScheduleItem(value['title'], id: key));
  //       });
  //     }
  //     return items;
  //   });
  // }

  Future<void> addScheduleItem(String title) async {
    final currentUser = FirebaseAuth.instance.currentUser;

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/${currentUser!.uid}').get();

    if (snapshot.exists) {
      final dataString = json.encode(snapshot.value);

      Map<String, dynamic> data = json.decode(dataString);

      final userEntity = UserModel.fromFirebaseMap(data);
      if (userEntity.uType != null) {
        if (userEntity.uType == 'KSCKitchen') {
          DatabaseReference _restaurantRef = _scheduleRef.child('ksc');
          DatabaseReference _DayRef = _restaurantRef.child('sunday');
          DatabaseReference _mealRef = _DayRef.push();
          await _mealRef.set(title);
        } else if (userEntity.uType == 'AwbaraKitchen') {
          DatabaseReference _restaurantRef = _scheduleRef.child('awbara');
          DatabaseReference _DayRef = _restaurantRef.child('sunday');
          DatabaseReference _mealRef = _DayRef.push();
          await _mealRef.set(title);
        }
      }
    }

    Future<void> deleteScheduleItem(String id) {
      return _scheduleRef.child(id).remove();
    }
  }
}
