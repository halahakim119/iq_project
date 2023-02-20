import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final String department;

  const SignupEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.department,
  });

  @override
  List<Object?> get props => [name, email, password, department];
}
