part of 'update_cubit.dart';

@freezed
class UpdateState with _$UpdateState {
  const factory UpdateState.updateInitial() = _UpdateInitial;
  const factory UpdateState.updateLoading() = _UpdateLoading;
  const factory UpdateState.updateLoaded() = _UpdateLoaded;
  const factory UpdateState.updateError(String error) = _UpdateError;
}
