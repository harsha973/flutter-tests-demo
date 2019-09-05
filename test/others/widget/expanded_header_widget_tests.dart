import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_header_widget.dart';

import '../../test_material_app.dart';

void main() {

  Widget _widget({
    VoidCallback onTapped
  }) {
    return TestMaterialAppWidget(
        home: ExpandedHeaderWidget(
          onTapped: onTapped ?? () {},
        )
    );
  }

  testWidgets('Should see Coffee header text', (WidgetTester tester) async {
    // Given

    //  when
    await tester.pumpWidget(_widget());

    //  then
    expect(find.text('Coffee'), findsOneWidget);
  });

  testWidgets('Should see fun fact header text', (WidgetTester tester) async {
    // Given

    //  when
    await tester.pumpWidget(_widget());

    //  then
    expect(find.text('fun fact'), findsOneWidget);
  });

  testWidgets('Should see fun fact header text', (WidgetTester tester) async {
    // Given

    //  when
    await tester.pumpWidget(_widget());

    //  then
    expect(find.text('fun fact'), findsOneWidget);
  });

  testWidgets('onTapped callback should be called', (WidgetTester tester) async {
    // Given
    var tapped;
    await tester.pumpWidget(_widget(onTapped: () { tapped = true; } ));

    //  when
    await tester.tap(find.byType(InkWell));

    //  then
    expect(tapped, true);
  });
}