import 'package:flutter/material.dart';
import 'makeCard.dart';
import 'webService.dart';
import 'constants.dart';
import 'NewsArticle.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: NewsList(),
    );
  }
}





