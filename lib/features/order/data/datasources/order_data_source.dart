import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';
import '../../domain/entities/order_entity.dart';

abstract class OrderDataSource {
  Future<Either<Failure, Unit>> order(OrderEntity parameters);
}

class OrderDataSourceImpl implements OrderDataSource {
  @override
  Future<Either<Failure, Unit>> order(OrderEntity parameters) async {
    try {
      final response = await http.post(
        Uri.parse('https://your-server.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(parameters),
      );

      return const Right(unit);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
