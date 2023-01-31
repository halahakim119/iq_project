import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../../domain/entities/user_entity.dart';
import '../../logic/cubit/update_cubit.dart';
import '../pages/user_profile.dart';

class EditProfile extends StatelessWidget {
  final UserEntity userEntity;

  const EditProfile({required this.userEntity});

  @override
  Widget build(BuildContext context) {
    final UpdateCubit updateCubit = di.sl<UpdateCubit>()
      ..updateUserData(userEntity);
    updateCubit.updateUserData(userEntity);

    return BlocProvider(
      create: (_) => updateCubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit profile')),
        body: BlocConsumer<UpdateCubit, UpdateState>(
          listener: (context, state) {
            state.maybeWhen(
                updateError: (error) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error)));
                },
                orElse: () {});
          },
          builder: (context, state) {
            return state.when(
              updateInitial: () => Container(),
              updateLoading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              updateLoaded: () => UserProfile(),
              updateError: (error) => Center(
                child: Text(error.toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}
