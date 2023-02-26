import 'dart:async';

import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../../domain/entities/schedule_entity.dart';
import '../../domain/repositories/schedule_repository.dart';
import '../datasources/schedule_data_source.dart';
import '../models/schedule_model.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource scheduleDataSource;

  ScheduleRepositoryImpl({required this.scheduleDataSource});
  @override
  Future<Either<FirebaseFailure, ScheduleEntity>> getData() async {
    try {
      final data = await scheduleDataSource.getSchedule();
      return data.fold((failure) => Left(failure), (schedule) {
        final ScheduleModel data = ScheduleModel.fromJson(schedule);

        return Right(data);
      });
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
