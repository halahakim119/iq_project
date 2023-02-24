import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String name,
    required String email,
    required String department,
    required String uType,
  }) : super(name: name, email: email, department: department, uType: uType);

  Map<String, dynamic> toFirebaseMap() {
    return {
      'name': name,
      'email': email,
      'department': department,
      'uType': uType,
    };
  }

  factory UserModel.fromFirebaseMap(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        department: json['department'] as String,
        uType: json['uType'] as String);
  }
  UserModel copyWith({
    required String name,
    required String email,
    required String department,
    required String uType,
  }) {
    return UserModel(
        name: name, email: email, department: department, uType: uType);
  }
}
