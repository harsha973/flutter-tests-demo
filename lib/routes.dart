import 'package:flutter/material.dart';
import 'package:flutter_tests/first_screen.dart';
import 'package:flutter_tests/main.dart';

class Routes {
  static const HOME_SCREEN_ROUTE = '/home_screen';
  static const FIRST_SCREEN_ROUTE = '/first_screen';

  static Map<String, WidgetBuilder> routes() {
    return <String, WidgetBuilder>{
      FIRST_SCREEN_ROUTE: (context) => FirstPage(),
      HOME_SCREEN_ROUTE: (context) => HomePage()
    };
  }
}