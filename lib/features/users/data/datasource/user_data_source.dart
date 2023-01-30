import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:iq_project/features/users/data/models/user_model.dart';
import 'package:iq_project/features/users/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';

abstract class UserDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData();
  Future<Unit> updateUser(UserEntity userEntity);
}

class UserDataSourceImpl implements UserDataSource {
  String userInfo =
      '{"name":"hala","password":"hakim","email":"hala.hakim","department":"hr"}';

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUserData() async {
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');

    // final response = await http.get(
    //   Uri.parse('https://your-server-url/user'),
    //   headers: {'Authorization': 'Bearer $token'},
    // );

    // final decodedJson = json.decode(response.body);
    // return decodedJson;

    final decodedJson = json.decode(userInfo);
    return Right(decodedJson);
  }

  @override
  Future<Unit> updateUser(UserEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final body = {
      "name": user.name,
      "password": user.password,
      "department": user.department,
      "email": user.email,
    };

    final response = await http.patch(
      Uri.parse('https://your-server.com/users/$id'),
      body: body,
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
