import 'package:flutter/material.dart';

enum RouteEnum {
  Home,
  Settings,
}

extension RouteMethods on RouteEnum {
  String get route {
    switch (this) {
      case RouteEnum.Home:
        return '/home';
      case RouteEnum.Settings:
        return '/settings';
      default:
        return null;
    }
  }
}
