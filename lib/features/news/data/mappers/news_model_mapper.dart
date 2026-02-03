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
}

extension SourceModelMapper on SourceModel {
  SourceEntity toEntity() {
    return SourceEntity(id: id ?? '', name: name ?? '');
  }
}
