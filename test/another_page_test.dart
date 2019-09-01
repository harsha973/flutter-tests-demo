
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests/another_page.dart';
import 'package:flutter_tests/routes.dart';

import 'test_material_app.dart';
import 'test_navigator_observer.dart';

void main() {
  TestNavigatorObserver _navObserver;

  Widget _testHomePage() {
    return TestMaterialAppWidget(
      home: TestHomePage(),
      navigatorObserver: _navObserver,
      routes: _routes(),
    );
  }

  setUp(() {
   _navObserver = TestNavigatorObserver();
  });

  Future _pumpAnotherPage(WidgetTester tester) async {
    await tester.pumpWidget(_testHomePage()); // Push a TestHomePage as start page
    await tester.tap(find.byType(RaisedButton)); // Tap to push AnotherPage
    await tester.pumpAndSettle(); // Flushes any pending tasks like animations etc.
  }

  testWidgets("'Take me back' button tap should pop AnotherPage", (WidgetTester tester) async {
    //  given
    await _pumpAnotherPage(tester);
    var isPopped = false;
    _navObserver.attachPopRouteObserver(
        Routes.ANOTHER_SCREEN_ROUTE, () { isPopped = true; return; });

    //  when
    await tester.tap(find.text('Take me back'));

    //  then
    expect(isPopped, isTrue);
  });

  testWidgets("AnotherPage pop with 'Success' Result", (WidgetTester tester) async {
    //  given
    await _pumpAnotherPage(tester);

    //  when
    await tester.tap(find.text('Take me back'));

    //  then
    expect(_result, 'Success');
  });

}

Map<String, WidgetBuilder> _routes() {
  return <String, WidgetBuilder>{
    Routes.ANOTHER_SCREEN_ROUTE: (context) => AnotherPage(),
  };
}

var  _result;
class TestHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => RaisedButton(onPressed: () async {
     _result = await Navigator.pushNamed(context, Routes.ANOTHER_SCREEN_ROUTE);
  });
}