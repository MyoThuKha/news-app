import 'package:drift/drift.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/core/utils/date_format_util.dart';
import 'package:news/features/news/data/mappers/source_mapper.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension NewsModelMapper on NewsModel {
  NewsEntity toEntity() {
    return NewsEntity(
      source: source != null
          ? SourceMapper(source!).toEntity()
          : const .empty(),
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: DateFormatUtil.parseUtc(publishedAt),
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
      publishedAt: Value(DateFormatUtil.parseUtc(publishedAt)),
      content: Value(content),
    );
  }
}
