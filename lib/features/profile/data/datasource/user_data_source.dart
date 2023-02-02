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
        '{"id":"123","name":"hala","password":"hakim","email":"hala.hakim","department":"hr"}';
    final decodedJson = json.decode(userInfo);
    return Right(decodedJson);
    //  final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    // final id = prefs.getString('id');
    //  use id;

    // final headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    // final response =
    //     await http.get(Uri.parse('<API_END_POINT>'), headers: headers);
    // if (response.statusCode >= 200 && response.statusCode < 300) {
    //   final Map<String, dynamic> data = json.decode(response.body);
    //   return Right(data);
    // } else {
    //   return Left(ServerFailure());
    // }
  }
}
