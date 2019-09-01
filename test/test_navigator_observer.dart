import 'package:flutter/material.dart';

typedef OnObservation = void Function(Route<dynamic> route, Route<dynamic> previousRoute);

class TestNavigatorObserver extends NavigatorObserver {
  OnObservation onPushed;
  OnObservation onPopped;

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPopped != null) {
      onPopped(route, previousRoute);
    }
  }

  attachPopRouteObserver(String expectedRouteName, Function poppedCallback) {
    onPopped = (route, previousRoute) {
      final isExpectedRoutePopped = route.settings.name == expectedRouteName;
      // trigger callback if expected route is popped
      if(isExpectedRoutePopped) { poppedCallback(); }
    };
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (onPushed != null) {
      onPushed(route, previousRoute);
    }
  }

  attachPushRouteObserver(String expectedRouteName, Function pushCallback) {
    onPushed = (route, previousRoute) {
      final isExpectedRoutePushed = route.settings.name == expectedRouteName;
      // trigger callback if expected route is pushed
      if(isExpectedRoutePushed) { pushCallback(); }
    };
  }

  attachPushRouteObserverWithArgs(
      String expectedRouteName,
      VoidCallback pushCallback(Object args)
    ) {
    onPushed = (route, previousRoute) {
      final isExpectedRoutePushed = route.settings.name == expectedRouteName;
      // trigger callback if expected route is pushed
      if(isExpectedRoutePushed) { pushCallback(route.settings.arguments); }
    };
  }
}