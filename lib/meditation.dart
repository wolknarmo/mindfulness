import 'package:flutter/material.dart';
import 'package:mindfulness/constants.dart';
import 'package:mindfulness/item_card.dart';
import 'package:mindfulness/models.dart';

class Catalogue extends StatelessWidget {
  final List<Group> groups;

  const Catalogue({Key key, this.groups}) : super(key: key);

  @override
  Widget build(BuildContext context) => getGroupList();

  getGroupList() => ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) => Container(
            height: CARD_HEIGHT,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    groups[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                getGroupItemsList(groups[index]),
              ],
            )),
      );

  getGroupItemsList(Group group) => ListView.builder(
        padding: EdgeInsets.only(top: 32, bottom: 16),
        scrollDirection: Axis.horizontal,
        itemCount: group.items.length,
        itemBuilder: (context, index) => ItemCard(group.items[index]),
      );
}
