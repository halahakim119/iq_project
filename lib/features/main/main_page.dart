import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../core/router/router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        WeeklyScheduleScreenRoute(),
        DailyScheduleScreenRoute(),
        ProfileScreenRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                UniconsLine.calendar_alt,
              ),
              label: 'schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                UniconsLine.restaurant,
              ),
              label: 'order',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                UniconsLine.user,
              ),
              label: 'profile',
            ),
          ],
        );
      },
    );
  }
}
