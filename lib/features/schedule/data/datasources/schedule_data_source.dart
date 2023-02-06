import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ScheduleDataSource {
  Future<Either<Failure, Map<String, dynamic>>> getSchedule();
}

class ScheduleDataSourceImpl implements ScheduleDataSource {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getSchedule() async {
    String schedule = '''{
    "sunday": {
      "ksc": {
        "id": 1,
        "meals": [
          {
            "id": 1,
            "meal": "1rice"
          },
          {
            "id": 2,
            "meal": "1salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "1rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "1salad + potatoes + meat"
          }
        ]
      }
    },
    "monday": {
      "ksc": {
        "id": 1,
        "meals": [
          {
            "id": 1,
            "meal": "2rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "2salad + potatoes + meat"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "2rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "2salad + potatoes + meat"
          }
        ]
      }
    },
    "tuesday": {
      "ksc": {
        "id": 1,
        "meals": [
          {
            "id": 1,
            "meal": "3rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "3salad + potatoes + meat"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "3rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "3salad + potatoes + meat"
          }
        ]
      }
    },
    "wednesday": {
      "ksc": {
        "id": 1,
        "meals": [
          {
            "id": 1,
            "meal": "4rice + potatoes + salad"
          },
          {
            "id": 2,
            "meal": "4salad + potatoes + meat"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "4rice"
          },
          {
            "id": 2,
            "meal": "4potatoes + meat"
          }
        ]
      }
    },
    "thursday": {
      "ksc": {
        "id": 1,
        "meals": [
          {
            "id": 1,
            "meal": "5potatoes + salad"
          },
          {
            "id": 2,
            "meal": "5salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "5rice"
          },
          {
            "id": 2,
            "meal": "5potatoes + meat"
          }
        ]
           }
           
           }    
            }
       
''';
    final decodedJson = json.decode(schedule);
   
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
