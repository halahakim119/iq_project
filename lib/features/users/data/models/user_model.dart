import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required String id,
      required String name,
      required String email,
      required String department,
      required String password})
      : super(
            id: id,
            password: password,
            name: name,
            email: email,
            department: department);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'department': department,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] as String,
        name: json['name'] as String,
        password: json['password'] as String,
        email: json['email'] as String,
        department: json['department'] as String);
  }
  UserModel copyWith({
    required String id,
    required String name,
    required String password,
    required String email,
    required String department,
  }) {
    return UserModel(
      id: id,
      name: name,
      password: password,
      email: email,
      department: department,
    );
  }
}
