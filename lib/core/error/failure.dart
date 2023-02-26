import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class FirebaseFailure extends Failure {
  final String message;

  FirebaseFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class FirebaseAuthFailure extends Failure {
  final String message;

  FirebaseAuthFailure([this.message = '']);

  @override
  List<Object> get props => [message];

  factory FirebaseAuthFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return FirebaseAuthFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return FirebaseAuthFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return FirebaseAuthFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return FirebaseAuthFailure(
          'Incorrect password, please try again.',
        );
      default:
        return FirebaseAuthFailure(
          'An unknown exception occurred.',
        );
    }
  }
}
