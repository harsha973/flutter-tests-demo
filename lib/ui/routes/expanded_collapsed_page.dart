import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/dimens.dart';
import 'package:flutter_tests/ui/others/widgets/expanded_header_widget.dart';
import 'package:flutter_tests/ui/others/widgets/expanding_section_widget.dart';

class ExpandedCollapsedPage extends StatefulWidget {

  @override
  _ExpandedCollapsedPageState createState() => _ExpandedCollapsedPageState();
}

class _ExpandedCollapsedPageState extends State<ExpandedCollapsedPage> {
  var _expanded = false;

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
                onTapped: () { setState(() { _expanded = !_expanded; }); }
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
}