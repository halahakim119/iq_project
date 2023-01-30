import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iq_project/features/users/domain/usecases/update_user_usecase.dart';

import '../../../domain/entities/user_entity.dart';

part 'update_state.dart';
part 'update_cubit.freezed.dart';

class UpdateCubit extends Cubit<UpdateState> {
  final UpdateUserUsecase updateUserUsecase;
  UpdateCubit({required this.updateUserUsecase}) : super(UpdateState.initial());

  void updateData(UserEntity userEntity) async {
    emit(const UpdateState.loading());
    final failureOrUpdate = await updateUserUsecase(userEntity);
    emit(failureOrUpdate.fold(
        (failure) => UpdateState.error(failure.toString()),
        (data) => UpdateState.loaded(userEntity)));
  }
}
