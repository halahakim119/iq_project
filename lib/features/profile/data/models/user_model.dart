import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String name,
      required String email,
      required String department,
      required String password})
      : super(
            password: password,
            name: name,
            email: email,
            department: department);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'department': department,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] as String,
        password: json['password'] as String,
        email: json['email'] as String,
        department: json['department'] as String);
  }
  UserModel copyWith({
    required String name,
    required String password,
    required String email,
    required String department,
  }) {
    return UserModel(
      name: name,
      password: password,
      email: email,
      department: department,
    );
  }
}
