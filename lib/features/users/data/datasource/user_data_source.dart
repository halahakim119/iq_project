import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';

abstract class UserDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData();
  Future<Unit> updateUser(String user, String type);
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
    print(decodedJson);
    return Right(decodedJson);
  }

  @override
  Future<Unit> updateUser(String data, String type) async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString('id');
    final body;
    if (type == "name") {
      body = {
        "name": data,
      };
    } else if (type == "department") {
      body = {
        "department": data,
      };
    } else if (type == "email") {
      body = {
        "email": data,
      };
    } else if (type == "password") {
      body = {
        "password": data,
      };
    } else {
      body = {''};
    }

    final response = await http.patch(
      Uri.parse('https://your-server.com/users/$id'),
      // headers: {'Authorization': 'Bearer $token'},
      body: body,
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
