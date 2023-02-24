import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String department;
  final String uType;

  const UserEntity({
    required this.name,
    required this.email,
    required this.department,
    required this.uType,
  });

  @override
  List<Object?> get props => [name, email, department,uType];
}
