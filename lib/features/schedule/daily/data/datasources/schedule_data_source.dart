import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class ScheduleDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getSchedule();
}

class UserDataSourceImpl implements ScheduleDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getSchedule() async {
    String schedule =
        '{"sunday": {"ksc": ["rice and beans","fries"],"awbara": ["rice and chicken","salad"]},"monday": {"ksc": [],"awbara": []},"tuesday": {"ksc": [],"awbara": []},"wednesday": {"ksc": [],"awbara": []},"thursday": {"ksc": [],"awbara": []}}';

    final decodedJson = json.decode(schedule);
    print(decodedJson);
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

    // final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString('token');
    // final id = prefs.getString('id');
    // use id;

    // final dio = Dio();
    // dio.options.headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };

    // try {
    //   final response = await dio.get('<API_END_POINT>');
    //   final Map<String, dynamic> data = response.data;
    //   return Right(data);
    // } on DioError catch (error) {
    //   return Left(ServerFailure());
    // }
  }
}
