import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, Unit>> register(SignupEntity parameters);
}
