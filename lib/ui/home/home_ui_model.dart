class HomeUIModel{
  final String title;
  final HomeListItemType type;

  HomeUIModel(this.title, this.type);
}

enum HomeListItemType {
  ANOTHER_PAGE,
  EXPAND_COLLAPSE_PAGE
}