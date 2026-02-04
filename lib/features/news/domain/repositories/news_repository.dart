import 'package:news/features/news/domain/entities/entities.dart';

abstract class NewsRepository {
  Stream<List<NewsEntity>> getNews();
  Future<PaginatedNewsEntity> fetchNews(int page, {int pageSize});
  Stream<NewsEntity> getNewsDetail(String url);
}
