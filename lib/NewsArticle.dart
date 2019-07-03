import 'constants.dart';
import 'dart:convert';
import 'webService.dart';


class NewsArticle {

  final String url;
  final String title;
  final String descrption;
  final String urlToImage;
  final String publishedAt;
  final String content;


  NewsArticle({this.url,this.title, this.descrption, this.urlToImage,this.publishedAt,this.content
  });

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
        title: json['title'],
        descrption: json['description'],
        urlToImage: json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
        url: json['url'],
        publishedAt: json['publishedAt'],
        content: json['content']
    );
  }
  static Resource<List<NewsArticle>> get all => Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result['articles'];
        return list.map((model) => NewsArticle.fromJson(model)).toList();
      }
  );
}
