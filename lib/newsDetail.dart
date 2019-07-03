import 'package:flutter/material.dart';
import 'makeCard.dart';
import 'webService.dart';
import 'constants.dart';
import 'NewsArticle.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class DetailPage extends StatefulWidget {
  DetailPage(this.url);

  final String url;

  @override
  createState() => DetailPageState(this.url);
}

  class DetailPageState extends State<DetailPage> {
  var _url;
  DetailPageState(this._url);



  Widget build(BuildContext context) {
    print('Testing');

    print(_url);
    return Scaffold(

      appBar: new AppBar(
        title: new Text(
          "Full Article",
        ),
      ),
      body: new Container(
          child: MaterialApp(
                routes: {
                  "/": (_) => new WebviewScaffold(
                    url: _url,
                    appBar: new AppBar(title: new Text("")),
                    hidden:true,
                  )
                },
              ),
          ),
      );
  }
}