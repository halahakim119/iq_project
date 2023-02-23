part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.loading() = _Loading;
  const factory OrderState.loaded(String id) = _Loaded;
  const factory OrderState.error(String error) = _Error;
}
