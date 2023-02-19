import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<Either<Failure, Unit>> login(LoginEntity parameters) async {
    try {
      final response = await http.post(
        Uri.parse('https://your-server.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(parameters),
      );

      final Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token'];
      persistToken(token);

      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}

void persistToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}
