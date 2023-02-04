import 'package:dartz/dartz.dart';
import 'package:iq_project/features/schedule/daily/domain/entities/schedule_entity.dart';
import 'package:iq_project/features/schedule/daily/domain/repositories/schedule_repository.dart';

import '/core/error/failure.dart';

class GetScheduleUsecase {
  final ScheduleRepository scheduleRepository;

  GetScheduleUsecase({required this.scheduleRepository});

  Future<Either<Failure, ScheduleEntity>> call() async {
    return await scheduleRepository.getData();
  }
}
