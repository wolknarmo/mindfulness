import 'package:flutter/material.dart';
import 'package:mindfulness/constants.dart';
import 'package:mindfulness/models.dart';
import 'package:mindfulness/player_screen.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerScreen(item)));
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: CARD_WIDTH,
          height: CARD_HEIGHT,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(item.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(item.title, style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: RaisedButton(
                    color: Colors.cyan,
                    child: Text("BEGIN", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerScreen(item)));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
