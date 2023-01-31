import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserUsecase {
  final UserRepository userRepository;
  GetUserUsecase({required this.userRepository});

  Future<Either<Failure, UserEntity>> call() async {
    return await userRepository.user();
  }
}
