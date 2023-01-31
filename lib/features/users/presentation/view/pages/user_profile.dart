import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../logic/cubit/user_cubit.dart';
import '../widgets/user_widget.dart';
import 'edit_profile_page.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<UserCubit>()..fetchData(),
      child: Scaffold(
        appBar: AppBar(title: const Text('user profile')),
        body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
          state.maybeWhen(
              error: (error) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(error)));
              },
              orElse: () {});
        }, builder: (context, state) {
          return Scaffold(
            body: state.when(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (data) => Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerTop,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                                user: data,
                              )
                          // EditProfile(userEntity: data),
                          ),
                    );
                  },
                  child: const Icon(Icons.edit),
                ),
                body: Center(
                    child: UserWidget(
                  name: data.name,
                  password: data.password,
                  department: data.department,
                  email: data.email,
                )),
              ),
              error: (error) => Center(
                child: Text(error.toString()),
              ),
            ),
          );
        }),
      ),
    );
  }
}
