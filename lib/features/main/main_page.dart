import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../core/router/router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(
          'iHUNGRY',
          style: TextStyle(
            letterSpacing: 4,
              color: Theme.of(context).colorScheme.secondary, fontSize: 20, fontFamily: 'Fredoka_One'),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: AutoTabsScaffold(
        routes: const [
          WeeklyScheduleScreenRoute(),
          DailyScheduleScreenRoute(),
          ProfileScreenRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CurvedNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            color: Theme.of(context).primaryColor,
            animationDuration: const Duration(milliseconds: 250),
            index: tabsRouter.activeIndex ,
            buttonBackgroundColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).backgroundColor,
            animationCurve: Curves.ease,
            items:  [
              Icon(
                UniconsLine.calendar_alt,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Icon(
                UniconsLine.restaurant,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Icon(
                UniconsLine.user,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ],
          );
        },
      ),
    );
  }
}
