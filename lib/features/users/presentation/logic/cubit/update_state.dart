part of 'update_cubit.dart';

@freezed
class UpdateState with _$UpdateState {
  const factory UpdateState.initial() = _Initial;
  const factory UpdateState.loading() = _Loading;
  const factory UpdateState.loaded(UserEntity user) = _Loaded;
  const factory UpdateState.error(String error) = _Error;
}
