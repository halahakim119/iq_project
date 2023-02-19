part of 'authentication_bloc.dart';


abstract class AuthenticationEvent {}

class AppStarted extends AuthenticationEvent {}

class SignedUp extends AuthenticationEvent {
  final String token;
  SignedUp({required this.token});
}

class LoggedIn extends AuthenticationEvent {
  final String token;
  LoggedIn({required this.token});
}

class LoggedOut extends AuthenticationEvent {}