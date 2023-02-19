import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';
import '../../domain/entities/signup_entity.dart';
import '../../domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  @override
  Future<Either<Failure, Unit>> register(SignupEntity parameters) async {
    try {
      await http.post(
        Uri.parse('https://your-server.com/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(parameters),
      );
      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
