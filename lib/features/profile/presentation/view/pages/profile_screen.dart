import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../../../auth/login_screen.dart';

import '../../logic/cubit/user_cubit.dart';
import '../../../../../core/theme/custom_elevated_button.dart';
import '../widgets/more_widget.dart';
import '../widgets/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => di.sl<UserCubit>()..fetchData(),
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Profile',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                const UserProfile(),
                const SizedBox(
                  height: 10,
                ),
                const Text('More',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                const MoreWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomElevatedButton(
                    onPressed: (() async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove("token");
                      prefs.remove("id");
                      context.router.pushNamed('auth');
                    }),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}


