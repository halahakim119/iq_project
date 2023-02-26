import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/firebase_exceptions.dart';
import '../../../profile/data/models/user_model.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final FirebaseAuth _firebaseAuth;
  final DatabaseReference _userRef;

  SignupRepositoryImpl(this._firebaseAuth, this._userRef);

  @override
  Future<Either<FirebaseAuthFailure, Unit>> register(
      SignupEntity parameters) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: parameters.email,
        password: parameters.password,
      );

      final currentUser = result.user;
      await currentUser?.updateDisplayName(parameters.name);
      await currentUser?.updatePhotoURL(parameters.department);

      await currentUser?.sendEmailVerification();

      final UserModel userModel = UserModel(
          name: parameters.name,
          email: parameters.email,
          department: parameters.department,
          uType: 'normal');

      await _userRef
          .child('users/${currentUser!.uid}')
          .set(userModel.toFirebaseMap());

      return const Right(unit);
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      return Left(FirebaseAuthFailure(e.message));
    } catch (e) {
      return Left(FirebaseAuthFailure(e.toString()));
    }
  }
}
