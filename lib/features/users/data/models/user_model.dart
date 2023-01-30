import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {String? name, String? email, String? department, String? password})
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
        name: json['name'] == null ? null : json['name'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        department:
            json['department'] == null ? null : json['department'] as String);
  }
  UserModel copyWith({
    String? name,
    String? password,
    String? email,
    String? department,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      department: department ?? this.department,
    );
  }
}
