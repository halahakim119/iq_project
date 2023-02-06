import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/user_cubit.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (data) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        data.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Department',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        data.department,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Email',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        data.email,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
          error: (error) => Center(
                child: Text(error.toString()),
              ));
    });
  }
}
