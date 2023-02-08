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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../features/auth/auth_screen.dart' as _i2;
import '../../features/main/main_page.dart' as _i5;
import '../../features/profile/presentation/view/pages/profile_screen.dart'
    as _i8;
import '../../features/profile/presentation/view/widgets/about_us_screen.dart'
    as _i3;
import '../../features/profile/presentation/view/widgets/ordering_policy_screen.dart'
    as _i4;
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart'
    as _i7;
import '../../features/schedule/presentation/view/weekly/pages/weekly_schedule_screen.dart'
    as _i6;
import '../../features/splash/loading_splash.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoadingSplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingSplash(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    AboutUsScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AboutUsScreen(),
      );
    },
    OrderingPolicyScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.OrderingPolicyScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MainPage(),
      );
    },
    WeeklyScheduleScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.WeeklyScheduleScreen(),
      );
    },
    DailyScheduleScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.DailyScheduleScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          LoadingSplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i9.RouteConfig(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        ),
        _i9.RouteConfig(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        ),
        _i9.RouteConfig(
          MainRoute.name,
          path: 'main',
          children: [
            _i9.RouteConfig(
              WeeklyScheduleScreenRoute.name,
              path: 'weekly',
              parent: MainRoute.name,
            ),
            _i9.RouteConfig(
              DailyScheduleScreenRoute.name,
              path: 'daily',
              parent: MainRoute.name,
            ),
            _i9.RouteConfig(
              ProfileScreenRoute.name,
              path: 'profile',
              parent: MainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoadingSplash]
class LoadingSplashRoute extends _i9.PageRouteInfo<void> {
  const LoadingSplashRoute()
      : super(
          LoadingSplashRoute.name,
          path: '/',
        );

  static const String name = 'LoadingSplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.AboutUsScreen]
class AboutUsScreenRoute extends _i9.PageRouteInfo<void> {
  const AboutUsScreenRoute()
      : super(
          AboutUsScreenRoute.name,
          path: 'aboutUs',
        );

  static const String name = 'AboutUsScreenRoute';
}

/// generated route for
/// [_i4.OrderingPolicyScreen]
class OrderingPolicyScreenRoute extends _i9.PageRouteInfo<void> {
  const OrderingPolicyScreenRoute()
      : super(
          OrderingPolicyScreenRoute.name,
          path: 'orderingPolicy',
        );

  static const String name = 'OrderingPolicyScreenRoute';
}

/// generated route for
/// [_i5.MainPage]
class MainRoute extends _i9.PageRouteInfo<void> {
  const MainRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i6.WeeklyScheduleScreen]
class WeeklyScheduleScreenRoute extends _i9.PageRouteInfo<void> {
  const WeeklyScheduleScreenRoute()
      : super(
          WeeklyScheduleScreenRoute.name,
          path: 'weekly',
        );

  static const String name = 'WeeklyScheduleScreenRoute';
}

/// generated route for
/// [_i7.DailyScheduleScreen]
class DailyScheduleScreenRoute extends _i9.PageRouteInfo<void> {
  const DailyScheduleScreenRoute()
      : super(
          DailyScheduleScreenRoute.name,
          path: 'daily',
        );

  static const String name = 'DailyScheduleScreenRoute';
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileScreenRoute extends _i9.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}
