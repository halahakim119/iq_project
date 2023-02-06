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
        title: const Text(
          'Projet name',
          style: TextStyle(color: Colors.white, fontSize: 18),
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
            index: tabsRouter.activeIndex,
            buttonBackgroundColor: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).backgroundColor,
            animationCurve: Curves.ease,
            items: const [
              Icon(
                UniconsLine.calendar_alt,
                color: Colors.white,
              ),
              Icon(
                UniconsLine.restaurant,
                color: Colors.white,
              ),
              Icon(
                UniconsLine.user,
                color: Colors.white,
              ),
            ],
          );
        },
      ),
    );
  }
}
