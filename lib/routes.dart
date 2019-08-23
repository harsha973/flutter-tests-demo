import 'package:flutter/material.dart';
import 'package:flutter_tests/first_screen.dart';
import 'package:flutter_tests/main.dart';

class Routes {
  static const HOME_SCREEN_ROUTE = '/';
  static const ANOTHER_SCREEN_ROUTE = '/another_screen';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      ANOTHER_SCREEN_ROUTE: (context) => AnotherPage(),
      HOME_SCREEN_ROUTE: (context) => HomePage(title: "Home Screen",)
    };
  }
}