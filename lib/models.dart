class Group {
  String title;
  List<Item> items;

  Group(this.title, this.items);
}

class Item {
  String title;
  String background;
  String audioAsset;

  Item({this.title, this.background, this.audioAsset});
}
