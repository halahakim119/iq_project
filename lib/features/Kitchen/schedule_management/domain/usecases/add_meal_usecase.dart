import 'package:dartz/dartz.dart';
import 'package:iq_project/features/Kitchen/schedule_management/domain/repositories/schedule_management_repository.dart';

import '../../../../../core/error/failure.dart';

class AddMealUsecase {
  final ScheduleManagementRepository repository;
  AddMealUsecase(this.repository);
  Future<Either<FirebaseFailure, Unit>> call(String meal, int dayIndex) async {
    return await repository.addMeal(meal, dayIndex);
  }
}
