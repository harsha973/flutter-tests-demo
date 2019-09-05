import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_section_widget.dart';

import '../../test_material_app.dart';
import '../mock_animation_utils.dart';

void main() {

  Widget _expandedSection({
    Widget child,
    bool expand
  }) {
    return TestMaterialAppWidget(
      home: ExpandingSectionWidget(
        expand: expand,
        child: child,
        animationUtils: MockAnimationUtils(),
      )
    );
  }

  testWidgets('Expanded state', (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(_expandedSection(
      child: Text('ABC'),
      expand: true,
    ));

    //  when
    RenderPositionedBox actualPositionedBox = tester.renderObject(find.byType(Align));

    //  then
    expect(actualPositionedBox.heightFactor, 1.0);
  });

  testWidgets('Collapsed state', (WidgetTester tester) async {
    // Given
    await tester.pumpWidget(_expandedSection(
      child: Text('ABC'),
      expand: false,
    ));

    //  when
    RenderPositionedBox actualPositionedBox = tester.renderObject(find.byType(Align));

    //  then
    expect(actualPositionedBox.heightFactor, 0.0);
  });

}