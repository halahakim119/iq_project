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
  Future<Either<Failure, Unit>> updateUser(String user, String type) async {
    final UserModel userModel;
    if (type == "name") {
      userModel = UserModel(
        name: user,
      );
    } else if (type == "department") {
      userModel = UserModel(
        department: user,
      );
    } else if (type == "email") {
      userModel = UserModel(email: user);
    } else if (type == "password") {
      userModel = UserModel(
        password: user,
      );
    } else {
      userModel = const UserModel();
    }

    try {
      await userDataSource.updateUser(user,type);
      return const Right(unit);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
