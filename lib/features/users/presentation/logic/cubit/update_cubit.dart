import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/update_user_usecase.dart';
import 'user_cubit.dart';

part 'update_cubit.freezed.dart';
part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  final UserCubit userCubit;
  final UpdateUserUsecase updateUserUsecase;
  UpdateCubit({required this.userCubit, required this.updateUserUsecase})
      : super(const UpdateState.updateInitial());

  Future<void> updateUserData(UserEntity userEntity) async {
    emit(const UpdateState.updateLoading());
    final failureOrSuccess = await updateUserUsecase(userEntity);

    // emit(failureOrSuccess
    //     .fold((failure) => UpdateState.updateError(failure.toString()), (_) {
    //   userCubit.fetchData();
    //   return const UpdateState.updateLoaded();
    // }));
    failureOrSuccess.fold(
      (failure) => emit(UpdateState.updateError(failure.toString())),
      (_) {
        emit(const UpdateState.updateLoaded());
        userCubit.fetchData();
      },
    );
  }
}
