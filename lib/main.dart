import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'newsList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Networking",
        theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
        home: NewsList()
    );
  }
}
