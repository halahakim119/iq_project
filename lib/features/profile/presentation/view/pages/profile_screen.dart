import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/injection/injection_container.dart' as di;
import '../../../../../core/splash/loading_splash.dart';
import '../../../../../what_do_we_have.dart';
import '../../../../auth/login_screen.dart';
import '../../logic/cubit/update_cubit.dart';
import '../../logic/cubit/user_cubit.dart';
import '../widgets/more_widget.dart';
import '../widgets/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    const bottomNavigationBarHeight = 100;

    return BlocProvider(
        create: (context) => di.sl<UpdateCubit>(),
        child:
            BlocConsumer<UpdateCubit, UpdateState>(listener: (context, state) {
          state.maybeWhen(
              updateLoading: () => ProfileScreen(),
              updateLoaded: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Profile Update"),
                        content: const Text("Profile Updated Successfully!"),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK"),
                          ),
                        ],
                      )),
              updateError: (error) => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("Profile Update"),
                        content: Text(error),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("OK"),
                          ),
                        ],
                      )),
              orElse: () {
                ProfileScreen();
              });
        }, builder: (context, state) {
          return BlocProvider(
              create: (_) => di.sl<UserCubit>()..fetchData(),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height -
                      (appBarHeight + bottomNavigationBarHeight),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Profile',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const UserProfile(),
                        const Text('More',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        const MoreWidget(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: (() async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("token");
                              prefs.remove("id");
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            }),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.7, 50),
                              backgroundColor:
                                  const Color.fromARGB(255, 119, 29, 22),
                            ),
                            child: const Text(
                              'Log Out',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }));
  }
}
