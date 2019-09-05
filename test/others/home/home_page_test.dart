// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/routes.dart';
import 'package:flutter_tests/ui/home/home_page.dart';
import '../../test_material_app.dart';
import '../../test_navigator_observer.dart';

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
    await tester.tap(find.text('Another screen'));

    //  then
    expect(isPushed, true);
  });

  testWidgets('Navigate to Another screen with arguments', (WidgetTester tester) async {
    //  given
    var actualArgs;
    await tester.pumpWidget(_homeWidget());
    _navObserver.attachPushRouteObserverWithArgs(
        Routes.ANOTHER_SCREEN_ROUTE, (args) {
          actualArgs = args; return;
        });

    //  when
    await tester.tap(find.text('Another screen'));

    //  then
    expect(actualArgs, 'You got a package, please collect.');
  });

  testWidgets('Navigate to Expanding/Collapsing screen', (WidgetTester tester) async {
    //  given
    var isPushed = false;
    await tester.pumpWidget(_homeWidget());
    _navObserver.attachPushRouteObserver(
        Routes.EXPANDED_COLLAPSED_ROUTE, () { isPushed = true; });

    //  when
    await tester.tap(find.text('Expanded/collapse view'));

    //  then
    expect(isPushed, true);
  });

  group('List items', () {

    testWidgets('Another screen list item is visible', (WidgetTester tester) async {
      //  given

      //  when
      await tester.pumpWidget(_homeWidget());

      //  then
      expect(find.text('Another screen'), findsOneWidget);
    });

    testWidgets('Expanded/collapsed list item is visible', (WidgetTester tester) async {
      //  given

      //  when
      await tester.pumpWidget(_homeWidget());

      //  then
      expect(find.text('Expanded/collapse view'), findsOneWidget);
    });

  });
}


