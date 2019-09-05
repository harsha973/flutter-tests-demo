
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_header_widget.dart';
import 'package:flutter_tests/ui/others/widgets/expanding_section_widget.dart';
import 'package:flutter_tests/ui/routes/expanded_collapsed_page.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test_material_app.dart';

void main() {
  Widget _widget({
    _MockSharedPrefs sharedPrefs
  }) {
    return TestMaterialAppWidget(
        home: ExpandedCollapsedPage(sharedPreferences: sharedPrefs)
    );
  }

  testWidgets('Should have one ExpandedHeaderWidget', (WidgetTester tester) async {
    // Given

    //  when
    await tester.pumpWidget(_widget());

    //  then
    expect(find.byType(ExpandedHeaderWidget), findsOneWidget);
  });

  testWidgets('Should have one ExpandingSectionWidget', (WidgetTester tester) async {
    // Given

    //  when
    await tester.pumpWidget(_widget());

    //  then
    expect(find.byType(ExpandingSectionWidget), findsOneWidget);
  });

  testWidgets('ExpandingSectionWidget is collapsed on load', (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(_widget());

    //  when
    final sectionWidget = tester.widget<ExpandingSectionWidget>(find.byType(ExpandingSectionWidget));

    //  then
    expect(sectionWidget.expand, false);
  });

  testWidgets('ExpandingSectionWidget is expanded on header tap', (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(_widget());

    //  when
    await tester.tap(find.byType(ExpandedHeaderWidget));
    await tester.pump();
    final sectionWidget = tester.widget<ExpandingSectionWidget>(find.byType(ExpandingSectionWidget));

    //  then
    expect(sectionWidget.expand, true);
  });

  group('Shared Prefs', () {
    _MockSharedPrefs sharedPrefs;

    setUp(() {
      sharedPrefs = _MockSharedPrefs();
    });

    testWidgets('Expanded state on load resuming previous saved state', (WidgetTester tester) async {
      // Given
      when(sharedPrefs.getBool('expandedKey')).thenReturn(true);
      await tester.pumpWidget(_widget(sharedPrefs: sharedPrefs));

      //  when
      await tester.pump(); // TODO - explain
      final sectionWidget = tester.widget<ExpandingSectionWidget>(find.byType(ExpandingSectionWidget));

      //  then
      expect(sectionWidget.expand, true);
    });

    testWidgets('Collapsed state on load resuming previous saved state', (WidgetTester tester) async {
      // Given
      when(sharedPrefs.getBool('expandedKey')).thenReturn(false);
      await tester.pumpWidget(_widget(sharedPrefs: sharedPrefs));

      //  when
      await tester.pump();
      final sectionWidget = tester.widget<ExpandingSectionWidget>(find.byType(ExpandingSectionWidget));

      //  then
      expect(sectionWidget.expand, false);
    });

  });
}

class _MockSharedPrefs extends Mock implements SharedPreferences {}