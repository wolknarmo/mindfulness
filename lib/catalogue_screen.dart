import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfulness/meditation.dart';
import 'package:mindfulness/stub_data.dart';

class CatalogueScreen extends StatefulWidget {
  @override
  CatalogueScreenState createState() => CatalogueScreenState();
}

class CatalogueScreenState extends State<CatalogueScreen> {
  final Map<int, Widget> tabTitles = {
    0: getTabTitle("MEDITATION"),
    1: getTabTitle("COURSES"),
    2: getTabTitle("SOUNDS"),
  };
  final List<Widget> tabs = [
    Catalogue(groups: meditationGroups),
    Catalogue(groups: coursesGroups),
    Catalogue(groups: soundsGroups),
  ];
  var selected = 0;

  static getTabTitle(String title) => Padding(
      padding: EdgeInsets.all(8),
      child: Text(title,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: Text("Mindfulness", style: TextStyle(color: Colors.black87))),
      ),
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoSegmentedControl(
                padding: EdgeInsets.all(8),
                groupValue: selected,
                borderColor: Colors.grey[200],
                selectedColor: Colors.white,
                unselectedColor: Colors.grey[200],
                pressedColor: Colors.grey[200],
                children: tabTitles,
                onValueChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                },
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 64), child: tabs[selected]),
        ],
      ),
    );
  }
}
