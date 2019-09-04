
import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/home/home_ui_model.dart';
import 'package:flutter_tests/ui/others/routes.dart';

class ListRowWidget extends StatelessWidget {
  final HomeUIModel uiModel;

  const ListRowWidget({Key key, this.uiModel})
      : assert(uiModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Text(uiModel.title,),
          ),
          onTap: () {_onTapped(context);},
        )
    );
  }

  Future _onTapped(BuildContext context) async {
    switch(uiModel.type) {

      case HomeListItemType.ANOTHER_PAGE:
        _navigateMeToAnotherPage(context);
        break;
      case HomeListItemType.EXPAND_COLLAPSE_PAGE:
        _navigateToExpandedCollapsedPage(context);
        break;
    }
  }

  _navigateMeToAnotherPage(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed(
        Routes.ANOTHER_SCREEN_ROUTE,
        arguments: 'You got a package, please collect.'
    );
    print('Result is : $result');
  }

  _navigateToExpandedCollapsedPage(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.EXPANDED_COLLAPSED_ROUTE);
  }

}