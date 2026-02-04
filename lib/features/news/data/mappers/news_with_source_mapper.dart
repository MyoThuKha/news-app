import 'package:news/features/news/data/mappers/mappers.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension NewsWithSourceMapper on NewsWithSource {
  NewsEntity toEntity() {
    return NewsEntity(
      source: source?.toEntity() ?? .empty(),
      author: news.author ?? '',
      title: news.title ?? '',
      description: news.description ?? '',
      url: news.url ?? '',
      urlToImage: news.urlToImage ?? '',
      publishedAt: news.publishedAt,
      content: news.content ?? '',
      cachedAt: news.createdAt,
    );
  }
}
