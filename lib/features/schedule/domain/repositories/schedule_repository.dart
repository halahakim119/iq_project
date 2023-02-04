import 'package:dartz/dartz.dart';
import 'package:iq_project/features/schedule/domain/entities/schedule_entity.dart';

import '/core/error/failure.dart';

abstract class ScheduleRepository {
  Future<Either<Failure, ScheduleEntity>> getData();
}
