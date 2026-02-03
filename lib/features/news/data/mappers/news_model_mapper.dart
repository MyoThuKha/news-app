import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/data/mappers/source_mapper.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension NewsModelMapper on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      source: source?.toEntity() ?? SourceEntity(id: '', name: ''),
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt ?? '',
      content: content ?? '',
    );
  }

  NewsTableCompanion toTableCompanion(String? sourceId) {
    return NewsTableCompanion(
      sourceId: Value(sourceId),
      author: Value(author),
      title: Value(title),
      description: Value(description),
      url: Value(url),
      urlToImage: Value(urlToImage),
      publishedAt: Value(publishedAt),
      content: Value(content),
    );
  }
}

