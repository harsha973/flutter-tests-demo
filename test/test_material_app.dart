import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/routes.dart';

import 'test_navigator_observer.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget home;
  final NavigatorObserver navigatorObserver;
  final Map<String, WidgetBuilder> routes;

  TestMaterialAppWidget({
    Key key,
    this.home,
    this.navigatorObserver,
    this.routes
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test',
      home: home,
      navigatorObservers: [navigatorObserver ?? TestNavigatorObserver()],
      routes: routes ?? _testRoutes(),
    );
  }

  Map<String, WidgetBuilder> _testRoutes() {
    return <String, WidgetBuilder>{
      Routes.ANOTHER_SCREEN_ROUTE: (context) => _testRoute(Routes.ANOTHER_SCREEN_ROUTE),
    };
  }

  _testRoute(String routeName) => DummyTestRoute(routeName: routeName);
}

class DummyTestRoute extends StatelessWidget {
  final String routeName;

  DummyTestRoute({Key key, this.routeName}): super(key: key ?? Key(routeName));

  @override
  Widget build(BuildContext context) => Text(routeName);

}