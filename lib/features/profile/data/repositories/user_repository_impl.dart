import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});
  @override
  Future<Either<FirebaseFailure, UserEntity>> user() async {
    try {
      final result = await userDataSource.getUserData();
      return result.fold(
        (failure) => Left(failure),
        (user) {
          return Right(user);
        },
      );
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(message: e.message));
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
