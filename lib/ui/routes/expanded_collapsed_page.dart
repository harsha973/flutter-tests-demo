import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/dimens.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_header_widget.dart';
import 'package:flutter_tests/ui/others/widgets/expanding_section_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpandedCollapsedPage extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  ExpandedCollapsedPage({this.sharedPreferences});

  @override
  _ExpandedCollapsedPageState createState() => _ExpandedCollapsedPageState();
}

class _ExpandedCollapsedPageState extends State<ExpandedCollapsedPage> {
  var _expanded = false;
  final expandedPrefsKey = 'expandedKey';

  @override
  void initState() {
    super.initState();
    _initExpandedState();
  }

  _initExpandedState() async {
    SharedPreferences prefs = await _getSharedPref();
    setState(() {
      _expanded = prefs.getBool(expandedPrefsKey) ?? false;
    });
  }

  Future<SharedPreferences> _getSharedPref() async {
    return widget.sharedPreferences ?? await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded Collapsed Page')),
      body: Padding(
        padding: EdgeInsets.all(Dimens.spacing_default),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ExpandedHeaderWidget(
                onTapped: () { setState(() {
                  _expanded = !_expanded;
                  _saveExpandedStateInSharedPrefs(_expanded);
                }); }
            ),
            ExpandingSectionWidget(
              expand: _expanded,
              child: _expendedSectionBody(),
            )
          ],
        )
      ),
    );
  }

  Widget _expendedSectionBody() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimens.spacing_default, right: Dimens.spacing_default,
            top: Dimens.spacing_half, bottom: Dimens.spacing_default),
        child: Text(
            'Finland is home to the biggest coffee lovers. The average adult'
                ' Finn goes through 27.5 pounds of coffee each year, according'
                ' to the International Coffee Organization.'
        ),
      ),
    );
  }

  void _saveExpandedStateInSharedPrefs(bool expanded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(expandedPrefsKey, expanded);
  }
}