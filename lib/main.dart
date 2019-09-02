import 'package:flutter/material.dart';
import 'package:flutter_tests/app_colors.dart';
import 'package:flutter_tests/app_raised_button.dart';
import 'package:flutter_tests/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      theme: ThemeData(primarySwatch: AppColors.primary,),
      routes: Routes.routes(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: AppRaisedButton(
          title: 'Next screen',
          onPressed: () {
            _onTapped(context);
          },
        ),
      ),
    );
  }

  Future _onTapped(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(
      Routes.ANOTHER_SCREEN_ROUTE,
      arguments: 'You got a package, please collect.'
    );
    print('Result is : $result');
  }
}
