import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/data/datasources/datasources.dart';
import 'package:news/features/news/data/mappers/mappers.dart';
import 'package:news/features/news/data/mappers/paginated_news_mapper.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({
    required NewsDao newsTable,
    required SourcesDao sourcesTable,
    required NewsApiService newsApiService,
  }) : _newsTable = newsTable,
       _sourcesTable = sourcesTable,
       _newsApiService = newsApiService;

  late final NewsDao _newsTable;
  late final SourcesDao _sourcesTable;
  late final NewsApiService _newsApiService;


  @override
  Future<PaginatedNewsEntity> fetchFeaturedNews(
    int page, {
    int pageSize = 1,
  }) async {
    try {
      final paginatedNews = await _newsApiService.fetchHeadlineNews(
        page,
        pageSize: pageSize,
      );

      final List<NewsTableCompanion> newsCompanions = [];
      final List<SourcesTableCompanion> sourcesCompanions = [];

      for (final news in paginatedNews.articles) {
        String? sourceId = news.source?.id;

        if (news.source != null) {
          final sourceCompanion = news.source!.toTableCompanion();
          sourcesCompanions.add(sourceCompanion);
        }
        final newsCompanion = news.toTableCompanion(sourceId, isFeatured: true);
        newsCompanions.add(newsCompanion);
      }

      // db insert operations
      if (sourcesCompanions.isNotEmpty) {
        await _sourcesTable.insertBulkSources(sourcesCompanions);
      }
      if (newsCompanions.isNotEmpty) {
        await _newsTable.insertBulkNews(newsCompanions);
      }

      return paginatedNews.toEntity(page, pageSize);
    } catch (_) {
      rethrow;
    }
  }


  @override
  Future<PaginatedNewsEntity> fetchNews(int page, {int pageSize = 20}) async {
    try {
      final paginatedNews = await _newsApiService.fetchNews(
        page,
        pageSize: pageSize,
      );

      final List<NewsTableCompanion> newsCompanions = [];
      final List<SourcesTableCompanion> sourcesCompanions = [];

      for (final news in paginatedNews.articles) {
        String? sourceId = news.source?.id;

        if (news.source != null) {
          final sourceCompanion = news.source!.toTableCompanion();
          sourcesCompanions.add(sourceCompanion);
        }
        final newsCompanion = news.toTableCompanion(sourceId);
        newsCompanions.add(newsCompanion);
      }

      // db insert operations
      if (sourcesCompanions.isNotEmpty) {
        await _sourcesTable.insertBulkSources(sourcesCompanions);
      }
      if (newsCompanions.isNotEmpty) {
        await _newsTable.insertBulkNews(newsCompanions);
      }

      return paginatedNews.toEntity(page, pageSize);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Stream<List<NewsEntity>> getNews() {
    return _newsTable.watchAllNews().map((newsList) {
      return newsList.map((news) => news.toEntity()).toList();
    });
  }

  @override
  Stream<NewsEntity?> getFeaturedNews() {
    return _newsTable.watchFeaturedNews().map((news) {
      if (news == null) return null;
      return news.toEntity();
    });
  }

  @override
  Stream<NewsEntity> getNewsDetail(String url) {
    return _newsTable.watchNews(identifier: url).map((news) {
      return news.toEntity();
    });
  }
}
