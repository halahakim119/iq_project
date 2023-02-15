import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String name,
    required String email,
    required String department,
  }) : super(name: name, email: email, department: department);

  Map<String, dynamic> toFirebaseMap() {
    return {
      'name': name,
      'email': email,
      'department': department,
    };
  }

  factory UserModel.fromFirebaseMap(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        department: json['department'] as String);
  }
  UserModel copyWith({
    required String name,
    required String email,
    required String department,
  }) {
    return UserModel(
      name: name,
      email: email,
      department: department,
    );
  }
}
