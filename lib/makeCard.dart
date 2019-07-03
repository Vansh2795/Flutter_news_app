import 'package:flutter/material.dart';
import 'newsDetail.dart';
import 'package:flutter/widgets.dart';
import 'NewsArticle.dart';
import 'constants.dart';
import 'webService.dart';

class NewsListState extends State<NewsList> {
  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
          setState(() => {_newsArticles = newsArticles})
        });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: _newsArticles[index].urlToImage == null
          ? Image.asset(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
          : Image.network(_newsArticles[index].urlToImage),
      subtitle:
          Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      onTap: () {
        var url = _newsArticles[index].url;
        Navigator.push(context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new DetailPage(url),
        ));
      },
    );
  }

  Card makeCard(BuildContext context, int index) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: _buildItemsForListView(context, index)
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('News'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: makeCard,
        ),
      ),
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewsList extends StatefulWidget {
  @override
  createState() => NewsListState();
}
