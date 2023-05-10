import 'package:news_repo_pattern/src/data/model/news_model.dart' as n;
import 'package:news_repo_pattern/src/domain/entities/news.dart';
import 'package:news_repo_pattern/src/domain/entities/source.dart';

class Mapper {
  News oneNews(n.Article newsModel) {
    return News(
      source: Source(id: newsModel.source.id, name: newsModel.source.name),
      title: newsModel.title,
      description: newsModel.description,
      url: newsModel.url,
      publishedAt: newsModel.publishedAt,
      content: newsModel.content,
      urlToImage: newsModel.urlToImage,
    );
  }

  List<News> toNews(n.NewsModel value) {
    List<News> news = [];

    for (var e in value.articles) {
      news.add(oneNews(e));
    }
    return news;
  }
}
