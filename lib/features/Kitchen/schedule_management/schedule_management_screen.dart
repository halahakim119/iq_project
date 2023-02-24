import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../core/injection/injection_container.dart';
import '../../../core/theme/app_theme/app_theme.dart';
import '../../../core/theme/app_theme/logic/theme_bloc.dart';
import '../../../core/theme/app_theme/logic/theme_event.dart';
import '../../profile/presentation/logic/cubit/user_cubit.dart';
import '../../profile/presentation/view/widgets/more_widget.dart';
import '../../profile/presentation/view/widgets/user_profile.dart';

class ScheduleManagementScreen extends StatelessWidget {
  const ScheduleManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool seleted = true;

    return BlocProvider(
        create: (_) => sl<UserCubit>()..fetchData(),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.primary),
                        color: Theme.of(context).colorScheme.onSecondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
                      padding: const EdgeInsets.all(20),
                      margin:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText('Profile',
                                  minFontSize: 20,
                                  maxFontSize: 30,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary)),
                              const SizedBox(
                                height: 10,
                              ),
                              UserProfile(),
                              const SizedBox(
                                height: 10,
                              ),
                              AutoSizeText('More',
                                  minFontSize: 20,
                                  maxFontSize: 30,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary)),
                              const MoreWidget(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  isSelected: seleted == true ? true : false,
                                  onPressed: () {
                                    BlocProvider.of<ThemeBloc>(context).add(
                                        ThemeChanged(
                                            theme: AppTheme.values[0]));
                                  },
                                  icon: const Icon(UniconsLine.sun)),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<ThemeBloc>(context).add(
                                        ThemeChanged(
                                            theme: AppTheme.values[1]));
                                  },
                                  icon: const Icon(UniconsLine.moon)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 15, left: 15, right: 15, top: 15),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onPressed: (() async {
                      await FirebaseAuth.instance.signOut();
                      context.router.replaceNamed('auth');
                    }),
                    child: Text('LOG OUT',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
