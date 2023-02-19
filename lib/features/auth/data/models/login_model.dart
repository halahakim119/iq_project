import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({String? email, String? password})
      : super(email: email, password: password);

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, Object?> json) {
    return LoginModel(
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String);
  }
}
