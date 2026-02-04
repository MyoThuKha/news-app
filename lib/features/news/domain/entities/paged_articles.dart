import 'package:news/features/news/domain/entities/entities.dart';

class PagedArticles {
  const PagedArticles({
    required this.articles,
    required this.totalResults,
    required this.page,
    required this.pageSize,
  });

  final List<NewsEntity> articles;
  final int totalResults;
  final int page;
  final int pageSize;

  bool get hasMore => articles.length + (page - 1) * pageSize < totalResults;
}
