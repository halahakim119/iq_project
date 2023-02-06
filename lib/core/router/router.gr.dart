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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../features/auth/auth_screen.dart' as _i2;
import '../../features/main/main_page.dart' as _i3;
import '../../features/profile/presentation/view/pages/profile_screen.dart'
    as _i6;
import '../../features/schedule/presentation/view/daily/page/daily_schedule_screen.dart'
    as _i5;
import '../../features/schedule/presentation/view/weekly/pages/weekly_schedule_screen.dart'
    as _i4;
import '../../features/splash/loading_splash.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LoadingSplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoadingSplash(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    WeeklyScheduleScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WeeklyScheduleScreen(),
      );
    },
    DailyScheduleScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.DailyScheduleScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LoadingSplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i7.RouteConfig(
          MainRoute.name,
          path: 'main',
          children: [
            _i7.RouteConfig(
              WeeklyScheduleScreenRoute.name,
              path: 'weekly',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              DailyScheduleScreenRoute.name,
              path: 'daily',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
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
class LoadingSplashRoute extends _i7.PageRouteInfo<void> {
  const LoadingSplashRoute()
      : super(
          LoadingSplashRoute.name,
          path: '/',
        );

  static const String name = 'LoadingSplashRoute';
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.WeeklyScheduleScreen]
class WeeklyScheduleScreenRoute extends _i7.PageRouteInfo<void> {
  const WeeklyScheduleScreenRoute()
      : super(
          WeeklyScheduleScreenRoute.name,
          path: 'weekly',
        );

  static const String name = 'WeeklyScheduleScreenRoute';
}

/// generated route for
/// [_i5.DailyScheduleScreen]
class DailyScheduleScreenRoute extends _i7.PageRouteInfo<void> {
  const DailyScheduleScreenRoute()
      : super(
          DailyScheduleScreenRoute.name,
          path: 'daily',
        );

  static const String name = 'DailyScheduleScreenRoute';
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileScreenRoute extends _i7.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileScreenRoute';
}
