import 'package:news/features/news/data/mappers/news_table_mapper.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/data/models/models.dart';

extension SavedNewsWithSourceMapper on SavedNewsWithSource {
  NewsEntity toNewsEntity() {
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
      isFeatured: news.isFeatured,
    );
  }

  SavedNewsEntity toSavedNewsEntity() {
    return SavedNewsEntity(news: toNewsEntity(), savedAt: savedAt);
  }
}
