import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, UserEntity>> user() async {
    final result = await userDataSource.getUserData();

    return result.fold(
      (failure) => Left(failure),
      (user) {
        return Right(user);
      },
    );
  }
}
