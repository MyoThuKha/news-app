import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension NewsTableMapper on NewsTableData {
  NewsEntity toEntity(SourceEntity source) {
    return NewsEntity(
      source: source,
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt ?? '',
      content: content ?? '',
    );
  }
}

extension SourceTableMapper on SourcesTableData {
  SourceEntity toEntity() {
    return SourceEntity(id: sourceId ?? '', name: name ?? '');
  }
}
