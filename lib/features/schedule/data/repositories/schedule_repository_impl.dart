import 'dart:async';

import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '../../domain/entities/schedule_entity.dart';
import '../../domain/repositories/schedule_repository.dart';
import '../datasources/schedule_data_source.dart';
import '../models/schedule_model.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleDataSource scheduleDataSource;

  ScheduleRepositoryImpl({required this.scheduleDataSource});
  @override
  Future<Either<Failure, ScheduleEntity>> getData() async {
    final data = await scheduleDataSource.getSchedule();
    

    return data.fold((failure) => Left(failure), (schedule) {
      final ScheduleModel data = ScheduleModel.fromJson(schedule);
 
      return Right(data);
    });
  }
}
