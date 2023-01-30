import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'core/theme/app_layout.dart';
import 'features/auth/auth_screen.dart';
import 'features/users/presentation/view/pages/user_profile.dart';
import 'features/schedule/daily/home.dart';


class WhatDoWeHave extends StatelessWidget {
  const WhatDoWeHave({super.key});

  @override
  Widget build(BuildContext context) {
    const token = true;
    return token == true
        ? AppLayout(
            bottomBarItems: const [
              BottomBarItem(
                  activeItem: Icon(
                    UniconsLine.calendar_alt,
                    color: Colors.white,
                  ),
                  inActiveItem: Icon(
                    UniconsLine.calendar_alt,
                    color: Color.fromARGB(255, 119, 29, 22),
                  ),
                  itemLabel: 'schedule'),
              BottomBarItem(
                  activeItem: Icon(
                    UniconsLine.restaurant,
                    color: Colors.white,
                  ),
                  inActiveItem: Icon(
                    UniconsLine.restaurant,
                    color: Color.fromARGB(255, 119, 29, 22),
                  ),
                  itemLabel: 'order'),
              BottomBarItem(
                  activeItem: Icon(
                    UniconsLine.user,
                    color: Colors.white,
                  ),
                  inActiveItem: Icon(
                    UniconsLine.user,
                    color: Color.fromARGB(255, 119, 29, 22),
                  ),
                  itemLabel: 'menu'),
            ],
            color: const Color.fromARGB(255, 119, 29, 22),
            screens: [Home(), Home(), UserProfile()],
          )
        : const AuthScreen();
  }
}