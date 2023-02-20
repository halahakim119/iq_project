import 'package:dartz/dartz.dart';

import '../../../../core/error/firebase_exceptions.dart';
import '../entities/signup_entity.dart';
import '../repositories/signup_repository.dart';

class SignupUseCase {
  final SignupRepository _signupRepository;

  SignupUseCase(this._signupRepository);

  Future<Either<SignUpWithEmailAndPasswordFailure, Unit>> call(
      SignupEntity parameters) async {
    return await _signupRepository.register(parameters);
  }
}
