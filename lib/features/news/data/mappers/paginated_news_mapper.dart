import 'package:news/features/news/data/mappers/mappers.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension PaginatedNewsMapper on PaginatedNewsModel {
  PaginatedNewsEntity toEntity(int page, int pageSize) {
    return PaginatedNewsEntity(
      articles: articles.map((news) => news.toEntity()).toList(),
      totalResults: totalResults,
      page: page,
      pageSize: pageSize,
    );
  }
}
