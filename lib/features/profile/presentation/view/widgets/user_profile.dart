import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/custom_loading.dart';

import '../../logic/cubit/user_cubit.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      return state.when(
        loading: () => const CustomLoading(),
        loaded: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: Theme.of(context).colorScheme.onSecondary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText('Full Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary)),
                AutoSizeText(
                  data.name,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
            Divider(color: Theme.of(context).colorScheme.onSecondary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText('Department',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary)),
                AutoSizeText(
                  data.department,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
            Divider(color: Theme.of(context).colorScheme.onSecondary),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText('Email',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary)),
                AutoSizeText(
                  data.email,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
            Divider(color: Theme.of(context).colorScheme.onSecondary),
          ],
        ),
        error: (e) => Center(child: Text(e)),
      );
    });
  }
}
