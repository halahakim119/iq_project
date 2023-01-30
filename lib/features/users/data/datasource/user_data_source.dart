import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:iq_project/features/users/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';

abstract class UserDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData();
  Future<Unit> updateUser(UserModel userModel);
}

class UserDataSourceImpl implements UserDataSource {
  String userInfo =
      '{"first_name":"hala","last_name":"hakim","email":"hala.hakim","department":"hr"}';

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
  Future<Unit> updateUser(UserModel userModel) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.patch(
      Uri.parse('https://your-server.com/signup'),
      headers: {'Authorization': 'Bearer $token'},
      body: jsonEncode(userModel),
    );
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
