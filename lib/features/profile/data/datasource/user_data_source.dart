import 'dart:convert';
import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

abstract class UserDataSource {
  Future<Either<FirebaseFailure, UserEntity>> getUserData();
}

class UserDataSourceImpl implements UserDataSource {
  final DatabaseReference userDatabaseReference;

  UserDataSourceImpl({required this.userDatabaseReference});
  @override
  Future<Either<FirebaseFailure, UserEntity>> getUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return Left(FirebaseFailure(message: 'current User isnull'));
      }

      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('users/${currentUser.uid}').get();

      if (snapshot.exists) {}

      final dataString = json.encode(snapshot.value);

      Map<String, dynamic> data = json.decode(dataString);

      final userEntity = UserModel.fromFirebaseMap(data);

      return Right(userEntity);
    } catch (e) {
      return Left(FirebaseFailure(message: e.toString()));
    }
  }
}
