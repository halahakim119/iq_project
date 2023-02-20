part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.signedUp() = _SignedUp;
  const factory AuthenticationState.loggedIn() = _LoggedIn;
  const factory AuthenticationState.loggedOut() = _LoggedOut;
  const factory AuthenticationState.error(String error) = _Error;
}
