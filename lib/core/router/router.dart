import 'package:auto_route/auto_route.dart';

import '../../features/auth/auth_screen.dart';
import '../../features/main/main_page.dart';
import '../../features/profile/presentation/view/pages/profile_screen.dart';
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart';
import '../../features/schedule/presentation/view/weekly/pages/weekly_schedule_screen.dart';
import '../../features/splash/loading_splash.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/',
      name: 'LoadingSplashRoute',
      page: LoadingSplash,
    ),
    AutoRoute(
      path: 'auth',
      name: 'AuthRoute',
      page: AuthScreen,
    ),
    AutoRoute(
      path: 'main',
      name: 'MainRoute',
      page: MainPage,
      children: [
        AutoRoute(
          path: 'weekly',
          name: 'WeeklyScheduleScreenRoute',
          page: WeeklyScheduleScreen,
        ),
        AutoRoute(
          path: 'daily',
          name: 'DailyScheduleScreenRoute',
          page: DailyScheduleScreen,
        ),
        AutoRoute(
          path: 'profile',
          name: 'ProfileScreenRoute',
          page: ProfileScreen,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
