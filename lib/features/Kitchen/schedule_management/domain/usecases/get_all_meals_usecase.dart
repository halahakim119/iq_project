import 'package:dartz/dartz.dart';
import 'package:iq_project/features/Kitchen/schedule_management/domain/repositories/schedule_management_repository.dart';

import '../../../../../core/error/failure.dart';

class GetAllMealsUsecase {
  final ScheduleManagementRepository repository;

  GetAllMealsUsecase(this.repository);

  Future<Either<FirebaseFailure, Map<String, dynamic>>> call() async {
    return await repository.getAllMeals();
  }
}
