import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required String email, required String password})
      : super(email: email, password: password);

  Map<String, Object?> toFirebaseMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromFirebaseMap(Map<String, Object?> json) {
    return LoginModel(
        email: json['email'] as String, password: json['password'] as String);
  }
}
