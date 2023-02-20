import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';

abstract class ScheduleDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getSchedule();
}

class ScheduleDataSourceImpl implements ScheduleDataSource {
  final _databaseReference = FirebaseDatabase.instance.reference();
  @override
  Future<Either<Failure, Map<String, dynamic>>> getSchedule() async {
    try {
      final snapshot = await _databaseReference.child('schedule').get();

      if (snapshot.exists) {}

      final dataString = json.encode(snapshot.value);

      Map<String, dynamic> data = json.decode(dataString);

      return Right(data);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
