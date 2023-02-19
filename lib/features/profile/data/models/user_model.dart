import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String userId,
    required String name,
    required String email,
    required String department,
  }) : super(userId: userId, name: name, email: email, department: department);

  Map<String, dynamic> toFirebaseMap() {
    return {
      'user_id': userId,
      'name': name,
      'email': email,
      'department': department,
    };
  }

  factory UserModel.fromFirebaseMap(Map<String, dynamic> json) {
    return UserModel(
        userId: json['user_id'] as String,
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
      userId: userId,
      name: name,
      email: email,
      department: department,
    );
  }
}
