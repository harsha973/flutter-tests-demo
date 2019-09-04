import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/dimens.dart';
import 'package:flutter_tests/ui/routes/expanded_section_widget.dart';

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
            ExpandedHeader(
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

class ExpandedHeader extends StatelessWidget {
  final VoidCallback onTapped;

  const ExpandedHeader({Key key, @required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.spacing_default),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Coffee', style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.bold),),
                SizedBox(height:Dimens.spacing_half_half),
                Text('fun fact'),
              ],
            ),
          ),
          onTap: () {onTapped();},
        ),
      ),
    );
  }

}