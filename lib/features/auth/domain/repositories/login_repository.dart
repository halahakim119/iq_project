import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<FirebaseAuthFailure, Unit>> login(LoginEntity parameters);
}
