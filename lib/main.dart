import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindfulness/catalogue_screen.dart';

void main() => runApp(Mindfulness());

class Mindfulness extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(body1: TextStyle(color: Colors.black54)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        home: CatalogueScreen(),
      );
}
