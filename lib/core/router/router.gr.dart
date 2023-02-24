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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../features/auth/presentation/view/auth_screen.dart' as _i2;
import '../../features/Kitchen/main/kitchen_main_page.dart' as _i6;
import '../../features/Kitchen/orders_management/orders_management_screen.dart'
    as _i11;
import '../../features/Kitchen/schedule_management/schedule_management_screen.dart'
    as _i10;
import '../../features/main/main_page.dart' as _i5;
import '../../features/profile/presentation/view/pages/profile_screen.dart'
    as _i9;
import '../../features/profile/presentation/view/widgets/about_us_screen.dart'
    as _i3;
import '../../features/profile/presentation/view/widgets/ordering_policy_screen.dart'
    as _i4;
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart'
    as _i8;
import '../../features/schedule/presentation/view/weekly/pages/weekly_schedule_screen.dart'
    as _i7;
import '../../features/splash/loading_splash.dart' as _i1;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    LoadingSplashRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingSplash(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    AboutUsScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AboutUsScreen(),
      );
    },
    OrderingPolicyScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OrderingPolicyScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    KitchenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.KitchenMainPage(),
      );
    },
    WeeklyScheduleScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.WeeklyScheduleScreen(),
      );
    },
    DailyScheduleScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.DailyScheduleScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    ScheduleManagementScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ScheduleManagementScreen(),
      );
    },
    OrdersManagementScreenRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.OrdersManagementScreen(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          LoadingSplashRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i12.RouteConfig(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        ),
        _i12.RouteConfig(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        ),
        _i12.RouteConfig(
          MainRoute.name,
          path: 'main',
          children: [
            _i12.RouteConfig(
              WeeklyScheduleScreenRoute.name,
              path: 'weekly',
              parent: MainRoute.name,
            ),
            _i12.RouteConfig(
              DailyScheduleScreenRoute.name,
              path: 'daily',
              parent: MainRoute.name,
            ),
            _i12.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i12.RouteConfig(
          KitchenRoute.name,
          path: 'kitchen',
          children: [
            _i12.RouteConfig(
              ScheduleManagementScreenRoute.name,
              path: 'schedule',
              parent: KitchenRoute.name,
            ),
            _i12.RouteConfig(
              OrdersManagementScreenRoute.name,
              path: 'orders',
              parent: KitchenRoute.name,
            ),
            _i12.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: KitchenRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoadingSplash]
class LoadingSplashRoute extends _i12.PageRouteInfo<void> {
  const LoadingSplashRoute()
      : super(
          LoadingSplashRoute.name,
          path: '/',
        );

  static const String name = 'LoadingSplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i12.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.AboutUsScreen]
class AboutUsScreenRoute extends _i12.PageRouteInfo<void> {
  const AboutUsScreenRoute()
      : super(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        );

  static const String name = 'AboutUsScreenRoute';
}

/// generated route for
/// [_i4.OrderingPolicyScreen]
class OrderingPolicyScreenRoute extends _i12.PageRouteInfo<void> {
  const OrderingPolicyScreenRoute()
      : super(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        );

  static const String name = 'OrderingPolicyScreenRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.KitchenMainPage]
class KitchenRoute extends _i12.PageRouteInfo<void> {
  const KitchenRoute({List<_i12.PageRouteInfo>? children})
      : super(
          KitchenRoute.name,
          path: 'kitchen',
          initialChildren: children,
        );

  static const String name = 'KitchenRoute';
}

/// generated route for
/// [_i7.WeeklyScheduleScreen]
class WeeklyScheduleScreenRoute extends _i12.PageRouteInfo<void> {
  const WeeklyScheduleScreenRoute()
      : super(
          WeeklyScheduleScreenRoute.name,
          path: 'weekly',
        );

  static const String name = 'WeeklyScheduleScreenRoute';
}

/// generated route for
/// [_i8.DailyScheduleScreen]
class DailyScheduleScreenRoute extends _i12.PageRouteInfo<void> {
  const DailyScheduleScreenRoute()
      : super(
          DailyScheduleScreenRoute.name,
          path: 'daily',
        );

  static const String name = 'DailyScheduleScreenRoute';
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileScreenRoute extends _i12.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i10.ScheduleManagementScreen]
class ScheduleManagementScreenRoute extends _i12.PageRouteInfo<void> {
  const ScheduleManagementScreenRoute()
      : super(
          ScheduleManagementScreenRoute.name,
          path: 'schedule',
        );

  static const String name = 'ScheduleManagementScreenRoute';
}

/// generated route for
/// [_i11.OrdersManagementScreen]
class OrdersManagementScreenRoute extends _i12.PageRouteInfo<void> {
  const OrdersManagementScreenRoute()
      : super(
          OrdersManagementScreenRoute.name,
          path: 'orders',
        );

  static const String name = 'OrdersManagementScreenRoute';
}
