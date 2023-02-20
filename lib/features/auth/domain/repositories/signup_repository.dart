import 'package:dartz/dartz.dart';

import '../../../../core/error/firebase_exceptions.dart';
import '../entities/signup_entity.dart';

abstract class SignupRepository {
  Future<Either<SignUpWithEmailAndPasswordFailure, Unit>> register(SignupEntity parameters);
}
