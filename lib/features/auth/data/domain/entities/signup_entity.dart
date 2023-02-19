import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? department;

  const SignupEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.department,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, password, department];
}
