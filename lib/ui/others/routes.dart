import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/routes/another_page.dart';
import 'package:flutter_tests/ui/home/home_page.dart';
import 'package:flutter_tests/ui/routes/expanded_collapsed_page.dart';

class Routes {
  static const HOME_SCREEN_ROUTE = '/';
  static const ANOTHER_SCREEN_ROUTE = '/another_screen';
  static const EXPANDED_COLLAPSED_ROUTE = '/expanded_collapsed_route';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      ANOTHER_SCREEN_ROUTE: (context) => AnotherPage(),
      HOME_SCREEN_ROUTE: (context) => HomePage(title: "Home Screen",),
      EXPANDED_COLLAPSED_ROUTE: (context) => ExpandedCollapsedPage()
    };
  }
}