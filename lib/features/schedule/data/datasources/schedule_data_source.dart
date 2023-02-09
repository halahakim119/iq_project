import 'dart:convert';

import 'package:dartz/dartz.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
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
            "meal": "Rice + roasted potatoes + mixed greens salad"
          },
          {
            "id": 2,
            "meal": "Fried rice + mashed potatoes + coleslaw salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "Rice pilaf + baked potatoes + tomato and cucumber salad"
          },
          {
            "id": 2,
            "meal": "Basmati rice + mashed sweet potatoes + carrot and raisin salad"
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
            "meal": "Rice and beans + french fried potatoes + Caesar salad"
          },
          {
            "id": 2,
            "meal": "Jasmine rice + boiled baby potatoes + spinach salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "Brown rice + roasted garlic potatoes + mixed fruit salad"
          },
          {
            "id": 2,
            "meal": "Stuffed bell peppers with rice and potatoes + arugula salad"
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
            "meal": "Stuffed bell peppers with rice and potatoes + arugula salad"
          },
          {
            "id": 2,
            "meal": "Rice and chicken stew + roasted baby potatoes + mixed vegetable salad."
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "Rice and tofu stir-fry + mashed purple potatoes + beet salad"
          },
          {
            "id": 2,
            "meal": "Rice and vegetable stir-fry + roasted fingerling potatoes + kale salad"
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
            "meal": "Rice and shrimp paella + fried yukon gold potatoes + cherry tomato and mozzarella salad"
          },
          {
            "id": 2,
            "meal": "Rice and beef stir-fry + crispy smashed potatoes + red onion and radicchio salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "Rice and sausage casserole + boiled red potatoes + red lettuce and apple salad"
          },
          {
            "id": 2,
            "meal": "Rice and mushroom risotto + mashed sweet and regular potatoes + mixed greens and feta cheese salad"
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
            "meal": "Rice and mushroom risotto + mashed sweet and regular potatoes + mixed greens and feta cheese salad"
          },
          {
            "id": 2,
            "meal": "Rice and pork chops + mashed purple and sweet potatoes + mixed greens and nuts salad"
          }
        ]
      },
      "awbara": {
        "id": 2,
        "meals": [
          {
            "id": 1,
            "meal": "Rice and lentil soup + boiled baby potatoes + mixed vegetable and lemon vinaigrette salad"
          },
          {
            "id": 2,
            "meal": "Rice and chicken alfredo + crispy rosemary roasted potatoes + mixed greens and pear salad."
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
