import 'package:flutter/material.dart';
import 'package:flutter_tests/app_colors.dart';

import 'dimens.dart';

class AppRaisedButton extends StatelessWidget {
  final String title;
  final ShapeBorder shapeBorder;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  AppRaisedButton({
    Key key,
    @required String title,
    @required VoidCallback onPressed,
    ShapeBorder shapeBorder,
    EdgeInsets padding
  })  : assert(onPressed != null),
        assert(title != null),
        this.onPressed = onPressed,
        this.title = title,
        this.shapeBorder = shapeBorder,
        this.padding = padding,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton (
        child: Padding(
          padding: _buildEdgeInsets(),
          child: Text(title),
        ),
        color: AppColors.primary,
        textColor: Colors.white,
        shape: _shapeBorder(),
        onPressed: () => { onPressed() }
    );
  }

  EdgeInsets _buildEdgeInsets() => padding ?? EdgeInsets.zero;

  ShapeBorder _shapeBorder() => shapeBorder ?? RoundedRectangleBorder (
      borderRadius: BorderRadius.circular(Dimens.button_corner_radius)
  );

}