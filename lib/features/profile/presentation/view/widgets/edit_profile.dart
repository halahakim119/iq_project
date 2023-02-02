import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/splash/loading_splash.dart';
import '../../../../../what_do_we_have.dart';
import '../../../domain/entities/user_entity.dart';
import '../../logic/cubit/update_cubit.dart';
import '../../logic/cubit/user_cubit.dart';

class EditProfile extends StatelessWidget {
  final UserEntity userEntity;

  const EditProfile({required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<UpdateCubit>()..updateUserData(userEntity),
      child: BlocBuilder<UpdateCubit, UpdateState>(
        builder: (context, state) {
          return state.when(
            updateInitial: () => const LoadingSplash(),
            updateLoading: () => const LoadingSplash(),
            updateLoaded: () {
              di.sl<UserCubit>().fetchData();
              return WhatDoWeHave(
                pageNum: 2,
              );
            },
            updateError: (error) => WhatDoWeHave(
              pageNum: 2,
            ),
          );
        },
      ),
    );
  }
}
