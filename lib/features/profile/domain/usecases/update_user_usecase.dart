import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository userRepository;
  UpdateUserUsecase({required this.userRepository});
  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await userRepository.updateUser(user);
  }
}
