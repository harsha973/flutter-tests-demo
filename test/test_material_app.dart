import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/routes.dart';

class TestMaterialAppWidget extends StatelessWidget {
  final Widget home;

  TestMaterialAppWidget({
    Key key,
    this.home,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Test',
      home: home,
      routes: _routes(),
    );
  }

  Map<String, WidgetBuilder> _routes() {
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