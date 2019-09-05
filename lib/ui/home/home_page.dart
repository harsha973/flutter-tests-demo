import 'package:flutter/material.dart';
import 'package:flutter_tests/ui/home/home_page_list_item.dart';
import 'package:flutter_tests/ui/home/home_ui_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: _listView(),
    );
  }

  _listView() {
    return ListView.separated(
      itemCount: listItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ListRowWidget(uiModel: listItems[index],);
      }, separatorBuilder: (BuildContext context, int index) {
        return Divider(height: 2,);
      },
    );
  }
}

final listItems = [
  HomeUIModel('Another screen', HomeListItemType.ANOTHER_PAGE),
  HomeUIModel('Expanded/collapse view', HomeListItemType.EXPAND_COLLAPSE_PAGE),
];