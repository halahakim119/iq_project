import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {String? firstName, String? lastName, String? email, String? department})
      : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            department: department);

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'department': department,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        lastName:
            json['last_name'] == null ? null : json['last_name'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        department:
            json['department'] == null ? null : json['department'] as String);
  }
    UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? department,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      department: department ?? this.department,
    );
  }
}
