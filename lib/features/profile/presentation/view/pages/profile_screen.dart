import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/theme/custom_elevated_button.dart';
import '../../logic/cubit/user_cubit.dart';
import '../widgets/more_widget.dart';
import '../widgets/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => di.sl<UserCubit>()..fetchData(),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     AutoSizeText('Profile',
                     minFontSize: 20,
                        maxFontSize: 30,
                        style:
                            TextStyle(fontWeight: FontWeight.bold,
                            color:  Theme.of(context).colorScheme.onTertiary )),
                    const SizedBox(
                      height: 10,
                    ),
                    const UserProfile(),
                    const SizedBox(
                      height: 10,
                    ),
                     AutoSizeText('More',
                        minFontSize: 20,
                        maxFontSize: 30,
                        style:
                            TextStyle(fontWeight: FontWeight.bold,color:  Theme.of(context).colorScheme.onTertiary)),
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
                          context.router.replaceNamed('auth');
                        }),
                        child: AutoSizeText(
                          'Log Out',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
