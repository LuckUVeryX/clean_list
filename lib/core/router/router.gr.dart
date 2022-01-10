// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/infinite_list/presentation/pages/infinite_list_page.dart'
    as _i2;
import '../app.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AppWrapper.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppWrapper());
    },
    InfiniteListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.InfiniteListPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(AppWrapper.name, path: '/'),
        _i3.RouteConfig(InfiniteListRoute.name, path: '/infinite-list')
      ];
}

/// generated route for
/// [_i1.AppWrapper]
class AppWrapper extends _i3.PageRouteInfo<void> {
  const AppWrapper() : super(AppWrapper.name, path: '/');

  static const String name = 'AppWrapper';
}

/// generated route for
/// [_i2.InfiniteListPage]
class InfiniteListRoute extends _i3.PageRouteInfo<void> {
  const InfiniteListRoute()
      : super(InfiniteListRoute.name, path: '/infinite-list');

  static const String name = 'InfiniteListRoute';
}
