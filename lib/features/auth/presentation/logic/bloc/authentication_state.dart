// part of 'authentication_bloc.dart';


import '../../../../profile/domain/entities/user_entity.dart';

abstract class AuthenticationState {}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final UserEntity user;
  AuthenticationAuthenticated({required this.user});
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
