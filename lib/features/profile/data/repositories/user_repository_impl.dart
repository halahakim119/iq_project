import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/user_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<Failure, UserEntity>> user() async {
    final result = await userDataSource.getUserData();
    return result.fold((failure) => Left(failure), (user) {
      final UserModel data = UserModel.fromJson(user);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserEntity user) async {
    final UserModel userModel = UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
      department: user.department,
    );
    try {
      await userDataSource.updateUser(userModel);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
