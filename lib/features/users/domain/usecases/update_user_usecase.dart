import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository userRepository;
  UpdateUserUsecase({required this.userRepository});
  Future<Either<Failure, Unit>> updateUser(String user, String type) async {
    return await userRepository.updateUser(user, type);
  }
}
