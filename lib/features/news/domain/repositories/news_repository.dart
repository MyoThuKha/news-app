import 'package:news/features/news/domain/entities/entities.dart';

abstract class NewsRepository {
  Stream<List<NewsEntity>> getNews();
  Future<PagedArticles> fetchNews(int page, {int pageSize});
}
