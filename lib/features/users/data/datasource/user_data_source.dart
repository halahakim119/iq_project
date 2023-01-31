import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:iq_project/features/users/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../models/user_model.dart';

// abstract class UserDataSource {
//   Future<Either<Failure, Map<String, dynamic>>> getUserData();
//   Future<Unit> updateUser(UserEntity userEntity);
// }

// class UserDataSourceImpl implements UserDataSource {
//   String userInfo =
//       '{"name":"hala","password":"hakim","email":"hala.hakim","department":"hr"}';

//   @override
//   Future<Either<Failure, Map<String, dynamic>>> getUserData() async {
//     // final prefs = await SharedPreferences.getInstance();
//     // final token = prefs.getString('token');

//     // final response = await http.get(
//     //   Uri.parse('https://your-server-url/user'),
//     //   headers: {'Authorization': 'Bearer $token'},
//     // );

//     // final decodedJson = json.decode(response.body);
//     // return decodedJson;

//     final decodedJson = json.decode(userInfo);
//     return Right(decodedJson);
//   }

//   @override
//   Future<Unit> updateUser(UserEntity user) async {
//     final prefs = await SharedPreferences.getInstance();
//     final id = prefs.getString('id');
//     final body = {
//       "name": user.name,
//       "password": user.password,
//       "department": user.department,
//       "email": user.email,
//     };

//     final response = await http.patch(
//       Uri.parse('https://your-server.com/users/$id'),
//       body: body,
//     );
//     if (response.statusCode == 200) {
//       return Future.value(unit);
//     } else {
//       throw ServerException();
//     }
//   }
// }

abstract class UserDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getUserData();
  Future<Unit> updateUser(UserModel userModel);
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

  @override
  Future<Unit> updateUser(UserModel userModel) async {
      final response =await http.put(
    Uri.parse('https://reqres.in/api/users/2'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': userModel.name,
    }),
  );
    
  
    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    // final id = prefs.getString('id');

    // final headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    //   'ID': 'Bearer $id',
    // };

    // final response = await http.put(
    //   Uri.parse('<API_END_POINT>'),
    //   headers: headers,
    //   body: json.encode(userModel.toJson()),
    // );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}
