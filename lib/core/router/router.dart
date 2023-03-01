import 'package:auto_route/auto_route.dart';

import '../../features/Kitchen/schedule_management/presentation/view/weekly/pages/weekly_schedule_screen.dart';
import '../../features/auth/presentation/view/auth_screen.dart';
import '../../features/main/kitchen_main_page.dart';
import '../../features/main/main_page.dart';
import '../../features/orders/orders_management_screen.dart';
import '../../features/profile/presentation/view/pages/profile_screen.dart';
import '../../features/profile/presentation/view/widgets/about_us_screen.dart';
import '../../features/profile/presentation/view/widgets/ordering_policy_screen.dart';
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart';
import '../../features/schedule/presentation/view/pages/schedule_management_screen.dart';
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
      path: 'aboutUs',
      name: 'AboutUsScreenRoute',
      page: AboutUsScreen,
    ),
    AutoRoute(
      path: 'orderingPolicy',
      name: 'OrderingPolicyScreenRoute',
      page: OrderingPolicyScreen,
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
    AutoRoute(
      path: 'kitchen',
      name: 'kitchenRoute',
      page: KitchenMainPage,
      children: [
        AutoRoute(
          path: 'schedule',
          name: 'ScheduleManagementScreenRoute',
          page: ScheduleManagementScreen,
        ),
        AutoRoute(
          path: 'orders',
          name: 'OrdersManagementScreenRoute',
          page: OrdersManagementScreen,
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
