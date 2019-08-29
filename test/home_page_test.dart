// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/first_screen.dart';

import 'package:flutter_tests/main.dart';
import 'package:flutter_tests/routes.dart';

import 'test_material_app.dart';
import 'test_navigator_observer.dart';

void main() {

  HomePage homePage;
  TestNavigatorObserver _navObserver;

  Widget _homeWidget() {
    return TestMaterialAppWidget(
      home: homePage,
      navigatorObserver: _navObserver,
    );
  }

  setUp(() {
    homePage = HomePage(title: "Test Home page");
    _navObserver = TestNavigatorObserver();
  });

  testWidgets("HomePage loaded", (WidgetTester tester) async {
    //  given

    //  when
    await tester.pumpWidget(_homeWidget());

    //  then
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets("Next screen text shown", (WidgetTester tester) async {
    //  given

    //  when
    await tester.pumpWidget(_homeWidget());

    //  then
    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('Navigate to Another screen', (WidgetTester tester) async {
    //  given
    var isPushed = false;
    await tester.pumpWidget(_homeWidget());
    _navObserver.attachPushRouteObserver(
        Routes.ANOTHER_SCREEN_ROUTE, () { isPushed = true; });

    //  when
    await tester.tap(find.byType(RaisedButton));

    //  then
    expect(isPushed, true);
  });
}


