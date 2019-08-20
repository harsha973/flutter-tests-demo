import 'package:flutter/material.dart';
import 'package:flutter_tests/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: HomePage(title: 'Flutter Demo Test project'),
      routes: Routes.routes(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Home screen',),
            RaisedButton(
              child: Text('First screen'),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.FIRST_SCREEN_ROUTE);
              },
            ),
          ],
        ),
      ),
    );
  }
}
