import 'package:dartz/dartz.dart';
import 'package:iq_project/features/Kitchen/schedule_management/domain/repositories/schedule_management_repository.dart';

import '../../../../../core/error/failure.dart';

class DeleteMealUsecase {
  final ScheduleManagementRepository repository;

  DeleteMealUsecase(this.repository);

  Future<Either<FirebaseFailure, Unit>> call(String mealtId,int dayIndex) async {
    return await repository.deleteMeal(mealtId,dayIndex);
  }
}
