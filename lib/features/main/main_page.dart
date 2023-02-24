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
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          floating: true,
          snap: true,
          automaticallyImplyLeading: false,
          title: AutoSizeText(
            'iHUNGRY',
            style: TextStyle(
                letterSpacing: 4,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
                fontFamily: 'Fredoka_One'),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
      ],
      body: AutoTabsScaffold(
        routes: const [
          WeeklyScheduleScreenRoute(),
          DailyScheduleScreenRoute(),
          ProfileScreenRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return CurvedNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            color: Colors.transparent,
            animationDuration: const Duration(milliseconds: 250),
            index: tabsRouter.activeIndex,
            buttonBackgroundColor: Theme.of(context).colorScheme.primary,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.ease,
            items: [
              Icon(
                UniconsLine.calendar_alt,
                color: tabsRouter.activeIndex == 0
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).colorScheme.primary,
              ),
              Icon(
                UniconsLine.restaurant,
                color: tabsRouter.activeIndex == 1
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).colorScheme.primary,
              ),
              Icon(
                UniconsLine.user,
                color: tabsRouter.activeIndex == 2
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).colorScheme.primary,
              ),
            ],
          );
        },
      ),
    ));
  }
}
