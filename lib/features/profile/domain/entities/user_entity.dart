import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String name;
  final String email;
  final String department;

  const UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.department,
  });

  @override
  List<Object?> get props => [userId, name, email, department];
}
