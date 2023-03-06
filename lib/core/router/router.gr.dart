// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../features/auth/presentation/view/auth_screen.dart' as _i2;
import '../../features/main/hq_main_page.dart' as _i7;
import '../../features/main/kitchen_main_page.dart' as _i6;
import '../../features/main/main_page.dart' as _i5;
import '../../features/order/presentation/view/orders_management_screen.dart' as _i12;
import '../../features/profile/presentation/view/pages/profile_screen.dart'
    as _i10;
import '../../features/profile/presentation/view/widgets/about_us_screen.dart'
    as _i3;
import '../../features/profile/presentation/view/widgets/ordering_policy_screen.dart'
    as _i4;
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart'
    as _i9;
import '../../features/schedule/presentation/view/pages/schedule_management_screen.dart'
    as _i11;
import '../../features/schedule/presentation/view/weekly/pages/weekly_schedule_screen.dart'
    as _i8;
import '../../features/splash/loading_splash.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    LoadingSplashRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingSplash(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    AboutUsScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AboutUsScreen(),
      );
    },
    OrderingPolicyScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OrderingPolicyScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    KitchenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.KitchenMainPage(),
      );
    },
    HQRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HQMainPage(),
      );
    },
    WeeklyScheduleScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.WeeklyScheduleScreen(),
      );
    },
    DailyScheduleScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DailyScheduleScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ProfileScreen(),
      );
    },
    ScheduleManagementScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ScheduleManagementScreen(),
      );
    },
    OrdersManagementScreenRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.OrdersManagementScreen(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          LoadingSplashRoute.name,
          path: '/',
        ),
        _i13.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i13.RouteConfig(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        ),
        _i13.RouteConfig(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        ),
        _i13.RouteConfig(
          MainRoute.name,
          path: 'main',
          children: [
            _i13.RouteConfig(
              WeeklyScheduleScreenRoute.name,
              path: 'weekly',
              parent: MainRoute.name,
            ),
            _i13.RouteConfig(
              DailyScheduleScreenRoute.name,
              path: 'daily',
              parent: MainRoute.name,
            ),
            _i13.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i13.RouteConfig(
          KitchenRoute.name,
          path: 'kitchen',
          children: [
            _i13.RouteConfig(
              ScheduleManagementScreenRoute.name,
              path: 'schedule',
              parent: KitchenRoute.name,
            ),
            _i13.RouteConfig(
              OrdersManagementScreenRoute.name,
              path: 'orders',
              parent: KitchenRoute.name,
            ),
            _i13.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: KitchenRoute.name,
            ),
          ],
        ),
        _i13.RouteConfig(
          HQRoute.name,
          path: 'HQ',
          children: [
            _i13.RouteConfig(
              WeeklyScheduleScreenRoute.name,
              path: 'weekly',
              parent: HQRoute.name,
            ),
            _i13.RouteConfig(
              OrdersManagementScreenRoute.name,
              path: 'orders',
              parent: HQRoute.name,
            ),
            _i13.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: HQRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoadingSplash]
class LoadingSplashRoute extends _i13.PageRouteInfo<void> {
  const LoadingSplashRoute()
      : super(
          LoadingSplashRoute.name,
          path: '/',
        );

  static const String name = 'LoadingSplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i13.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.AboutUsScreen]
class AboutUsScreenRoute extends _i13.PageRouteInfo<void> {
  const AboutUsScreenRoute()
      : super(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        );

  static const String name = 'AboutUsScreenRoute';
}

/// generated route for
/// [_i4.OrderingPolicyScreen]
class OrderingPolicyScreenRoute extends _i13.PageRouteInfo<void> {
  const OrderingPolicyScreenRoute()
      : super(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        );

  static const String name = 'OrderingPolicyScreenRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.KitchenMainPage]
class KitchenRoute extends _i13.PageRouteInfo<void> {
  const KitchenRoute({List<_i13.PageRouteInfo>? children})
      : super(
          KitchenRoute.name,
          path: 'kitchen',
          initialChildren: children,
        );

  static const String name = 'KitchenRoute';
}

/// generated route for
/// [_i7.HQMainPage]
class HQRoute extends _i13.PageRouteInfo<void> {
  const HQRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HQRoute.name,
          path: 'HQ',
          initialChildren: children,
        );

  static const String name = 'HQRoute';
}

/// generated route for
/// [_i8.WeeklyScheduleScreen]
class WeeklyScheduleScreenRoute extends _i13.PageRouteInfo<void> {
  const WeeklyScheduleScreenRoute()
      : super(
          WeeklyScheduleScreenRoute.name,
          path: 'weekly',
        );

  static const String name = 'WeeklyScheduleScreenRoute';
}

/// generated route for
/// [_i9.DailyScheduleScreen]
class DailyScheduleScreenRoute extends _i13.PageRouteInfo<void> {
  const DailyScheduleScreenRoute()
      : super(
          DailyScheduleScreenRoute.name,
          path: 'daily',
        );

  static const String name = 'DailyScheduleScreenRoute';
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileScreenRoute extends _i13.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i11.ScheduleManagementScreen]
class ScheduleManagementScreenRoute extends _i13.PageRouteInfo<void> {
  const ScheduleManagementScreenRoute()
      : super(
          ScheduleManagementScreenRoute.name,
          path: 'schedule',
        );

  static const String name = 'ScheduleManagementScreenRoute';
}

/// generated route for
/// [_i12.OrdersManagementScreen]
class OrdersManagementScreenRoute extends _i13.PageRouteInfo<void> {
  const OrdersManagementScreenRoute()
      : super(
          OrdersManagementScreenRoute.name,
          path: 'orders',
        );

  static const String name = 'OrdersManagementScreenRoute';
}
