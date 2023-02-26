import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_user_usecase.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserUsecase getData;
  UserCubit({required this.getData}) : super(const UserState.loading());

  Future<void> fetchData() async {
    emit(const UserState.loading());
    final failureOrUsers = await getData();
    emit(failureOrUsers.fold((failure) => UserState.error(failure.toString()),
        (data) => UserState.loaded(data)));
  }
}
