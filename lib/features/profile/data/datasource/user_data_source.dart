import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class UserDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData();
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData() async {
    String userInfo =
        '{"user_id":"123","name":"hala","email":"hala.hakim","department":"R&D"}';
    final decodedJson = json.decode(userInfo);
    return Right(decodedJson);
  }
}
