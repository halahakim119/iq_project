import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String password;
  final String email;
  final String department;

  const UserEntity({
    required this.name,
    required this.password,
    required this.email,
    required this.department,
  });

  @override
  List<Object?> get props => [name, password, email, department];
}
