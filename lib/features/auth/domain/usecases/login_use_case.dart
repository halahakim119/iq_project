import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<FirebaseAuthFailure, Unit>> call(LoginEntity parameters) async {
    return await _loginRepository.login(parameters);
  }
}
