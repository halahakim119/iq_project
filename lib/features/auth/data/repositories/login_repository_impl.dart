import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/firebase_exceptions.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final FirebaseAuth _firebaseAuth;

  LoginRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<LogInWithEmailAndPasswordFailure, Unit>> login(
      LoginEntity parameters) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: parameters.email, password: parameters.password);

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left(LogInWithEmailAndPasswordFailure(e.message!));
    } catch (_) {
      return const Left(LogInWithEmailAndPasswordFailure());
    }
  }
}
