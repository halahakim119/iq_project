import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? department;

  const UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.department,
  });

  @override
  List<Object?> get props => [firstName, lastName, email, department];

  
}
