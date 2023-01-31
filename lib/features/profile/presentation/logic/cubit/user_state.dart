part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.loaded(UserEntity user) = _Loaded;
  const factory UserState.error(String error) = _Error;
}
