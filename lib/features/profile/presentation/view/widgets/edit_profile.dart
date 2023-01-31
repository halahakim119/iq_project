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
              updateLoaded: () => Stack(
                children: [
                  UserProfile(),
                  Builder(
                    builder: (context) => SuccessDialog(),
                  ),
                ],
              ),
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

class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => UserProfile(),
              ),
            );
            return Container();
          } else {
            return Container(
              color: Colors.black26,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.check,
                            size: 50,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Update successful",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
