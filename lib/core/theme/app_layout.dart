import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../features/profile/presentation/view/pages/profile_screen.dart';
import '../../features/schedule/daily/home.dart';

class AppLayout extends StatefulWidget {
  List<Widget> screens = const [ProfileScreen(), Home(), ProfileScreen()];
  Color color = Color.fromARGB(255, 119, 29, 22);
  int pageNum;

  AppLayout({super.key, required this.pageNum});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int maxCount = 3;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController(initialPage: widget.pageNum);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        centerTitle: true,
        title: const Text(
          'What Do We Have?',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            widget.screens.length, (index) => widget.screens[index]),
      ),
      extendBodyBehindAppBar: false,
      extendBody: true,
      bottomNavigationBar: (widget.screens.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: widget.color,
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
                  itemLabel: 'menu',
                ),
              ],
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeIn,
                  
                );
              },
            )
          : null,
    );
  }
}
