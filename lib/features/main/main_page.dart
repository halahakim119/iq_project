import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../core/router/router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AutoSizeText(
          'iHUNGRY',
          style: TextStyle(
              letterSpacing: 4,
              color: Theme.of(context).colorScheme.background,
              fontSize: 20,
              fontFamily: 'Fredoka_One'),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
            color: Theme.of(context).colorScheme.primary,
            animationDuration: const Duration(milliseconds: 250),
            index: tabsRouter.activeIndex,
            buttonBackgroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.ease,
            items: [
              Icon(
                UniconsLine.calendar_alt,
                color: Theme.of(context).colorScheme.background,
              ),
              Icon(
                UniconsLine.restaurant,
                color: Theme.of(context).colorScheme.background,
              ),
              Icon(
                UniconsLine.user,
                color: Theme.of(context).colorScheme.background,
              ),
            ],
          );
        },
      ),
    );
  }
}
