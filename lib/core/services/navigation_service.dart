import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentRouteName = '';
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    _currentRouteName = routeName;
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  String get currentRouteName => _currentRouteName;

  Future<dynamic> navigateToAndReplace(String routeName, {Object? arguments}) {
    _currentRouteName = routeName;
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToAndClearStack(String routeName,
      {Object? arguments}) {
    _currentRouteName = routeName;
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (r) => false, arguments: arguments);
  }

  void goBackUnTill(String routName) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routName);
  }

  void goBack() {
    if (!navigatorKey.currentState!.canPop()) return;
    _currentRouteName = "";
    return navigatorKey.currentState!.pop();
  }

  void goBackWithData(dynamic data) {
    return navigatorKey.currentState!.pop(data);
  }
}
