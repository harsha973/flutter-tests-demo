// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_tests/main.dart';

import 'test_material_app.dart';

void main() {

  HomePage homePage;

  Widget _homeWidget() {
    return TestMaterialAppWidget(
      home: homePage,
    );
  }

  setUp(() {
    homePage = HomePage(title: "Test Home page");
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
}


