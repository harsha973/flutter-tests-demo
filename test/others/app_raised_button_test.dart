import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/ui/others/app_colors.dart';
import 'package:flutter_tests/ui/others/app_raised_button.dart';
import 'package:flutter_tests/ui/others/dimens.dart';

import '../test_material_app.dart';

void main() {

  Widget _wrapWithMaterialApp(AppRaisedButton appRaisedButton) {
    return TestMaterialAppWidget(
      home: appRaisedButton,
    );
  }

  testWidgets("AppRaisedButton shown", (WidgetTester tester) async {
    //  given
    final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.byType(AppRaisedButton), findsOneWidget);
  });

  testWidgets("Should see text 'Click me'", (WidgetTester tester) async {
    //  given
    final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));

    //  then
    expect(find.text('Click me'), findsOneWidget);
  });

  testWidgets("onPressed called on tapping RaisedButton", (WidgetTester tester) async {
    //  given
    var pressed = false;
    final widget = AppRaisedButton(title: 'Click me', onPressed: () {
      pressed = true;
    });

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));
    await tester.tap((find.byType(RaisedButton)));

    //  then
    expect(pressed, true);
  });

  testWidgets("Button text color should be white", (WidgetTester tester) async {
    //  given
    final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));
    final raisedButton = tester.widget<RaisedButton>(find.byType(RaisedButton));

    //  then
    expect(raisedButton.textColor, Colors.white);
  });

  testWidgets("Button color should be primary color", (WidgetTester tester) async {
    //  given
    final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

    //  when
    await tester.pumpWidget(_wrapWithMaterialApp(widget));
    final raisedButton = tester.widget<RaisedButton>(find.byType(RaisedButton));

    //  then
    expect(raisedButton.color, AppColors.primary);
  });

  group("Shape", () {

    testWidgets("Default shape for AppRaisedButton has circular border radius", (WidgetTester tester) async {
      //  given
      final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

      //  when
      await tester.pumpWidget(_wrapWithMaterialApp(widget));
      final raisedButton = tester.widget<RaisedButton>(find.byType(RaisedButton));

      //  then
      BorderRadius borderRadius = (raisedButton.shape as RoundedRectangleBorder).borderRadius;
      expect(borderRadius, BorderRadius.circular(Dimens.button_corner_radius));
    });

    testWidgets("Custom shape for AppRaisedButton", (WidgetTester tester) async {
      //  given
      final expectedBorder = StadiumBorder();
      final widget = AppRaisedButton(title: 'Click me', onPressed: () {},
        shapeBorder: expectedBorder,);

      //  when
      await tester.pumpWidget(_wrapWithMaterialApp(widget));
      final raisedButton = tester.widget<RaisedButton>(find.byType(RaisedButton));

      //  then
      expect(raisedButton.shape, expectedBorder);
    });

  });

  group("Padding", () {

    testWidgets("Additional Padding is applied", (WidgetTester tester) async {
      //  given
      final expectedPadding = EdgeInsets.all(10);
      final widget = AppRaisedButton(title: 'Click me', onPressed: () {},
        padding: expectedPadding,);

      //  when
      await tester.pumpWidget(_wrapWithMaterialApp(widget));
      final actualPadding = tester.widget<Padding>(find.byKey(Key('CustomPaddingKey')));

      //  then
      expect((actualPadding).padding, expectedPadding);
    });

    testWidgets("Padding is defaulted to zero", (WidgetTester tester) async {
      //  given
      final widget = AppRaisedButton(title: 'Click me', onPressed: () {});

      //  when
      await tester.pumpWidget(_wrapWithMaterialApp(widget));
      final actualPadding = tester.widget<Padding>(find.byKey(Key('CustomPaddingKey')));

      //  then
      expect((actualPadding).padding, EdgeInsets.zero);
    });
  });
}