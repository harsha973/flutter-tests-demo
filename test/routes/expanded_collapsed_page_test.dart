
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_header_widget.dart';
import 'package:flutter_tests/ui/others/widgets/expanding_section_widget.dart';
import 'package:flutter_tests/ui/routes/expanded_collapsed_page.dart';

import '../test_material_app.dart';

void main() {
  Widget _widget({
    VoidCallback onTapped
  }) {
    return TestMaterialAppWidget(
        home: ExpandedCollapsedPage()
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
}