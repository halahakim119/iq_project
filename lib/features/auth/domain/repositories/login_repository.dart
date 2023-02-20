import 'package:dartz/dartz.dart';

import '../../../../core/error/firebase_exceptions.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<LogInWithEmailAndPasswordFailure, Unit>> login(LoginEntity parameters);
}
