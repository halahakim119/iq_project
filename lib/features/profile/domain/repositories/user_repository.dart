import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> user();
  Future<Either<Failure, Unit>> updateUser(UserEntity user);
}