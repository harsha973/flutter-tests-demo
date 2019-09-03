import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/app_colors.dart';
import 'package:flutter_tests/ui/others/routes.dart';

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
