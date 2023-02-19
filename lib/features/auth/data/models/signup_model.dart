import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? department})
      : super(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            department: department);

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'department': department,
    };
  }

  factory SignupModel.fromJson(Map<String, Object?> json) {
    return SignupModel(
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        department:
            json['department'] == null ? null : json['department'] as String);
  }
}
