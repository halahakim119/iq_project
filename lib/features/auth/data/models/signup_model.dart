import '../../domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  const SignupModel(
      {required String name,
      required String email,
      required String password,
      required String department})
      : super(
            name: name,
            email: email,
            password: password,
            department: department);

  Map<String, Object?> toFirebaseMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'department': department,
    };
  }

  factory SignupModel.fromFirebaseMap(Map<String, Object?> json) {
    return SignupModel(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        department: json['department'] as String);
  }
}
