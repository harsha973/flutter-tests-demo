import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/others/dimens.dart';

class ExpandedHeaderWidget extends StatelessWidget {
  final VoidCallback onTapped;

  const ExpandedHeaderWidget({Key key, @required this.onTapped}) : super(key: key);

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