import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/data/datasources/local/local.dart';
import 'package:news/features/news/data/datasources/remote/news_api_service.dart';
import 'package:news/features/news/data/mappers/mappers.dart';
import 'package:news/features/news/data/models/models.dart';
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
  Future<PagedArticles> fetchNews(int page, {int pageSize = 20}) async {
    try {
      final pagedArticles = await _newsApiService.fetchNews(
        page,
        pageSize: pageSize,
      );

      final List<NewsTableCompanion> newsCompanions = [];
      final List<SourcesTableCompanion> sourcesCompanions = [];

      for (final newsEntity in pagedArticles.articles) {
        // Convert entity back to model for database operations
        final newsModel = NewsModel(
          source: newsEntity.source.id.isNotEmpty
              ? SourceModel(
                  id: newsEntity.source.id,
                  name: newsEntity.source.name,
                )
              : null,
          author: newsEntity.author.isNotEmpty ? newsEntity.author : null,
          title: newsEntity.title.isNotEmpty ? newsEntity.title : null,
          description: newsEntity.description.isNotEmpty
              ? newsEntity.description
              : null,
          url: newsEntity.url.isNotEmpty ? newsEntity.url : null,
          urlToImage: newsEntity.urlToImage.isNotEmpty
              ? newsEntity.urlToImage
              : null,
          publishedAt: newsEntity.publishedAt?.toIso8601String(),
          content: newsEntity.content.isNotEmpty ? newsEntity.content : null,
        );

        String? sourceId = newsModel.source?.id;

        if (newsModel.source != null) {
          final sourceCompanion = newsModel.source!.toTableCompanion();
          sourcesCompanions.add(sourceCompanion);
        }
        final newsCompanion = newsModel.toTableCompanion(sourceId);
        newsCompanions.add(newsCompanion);
      }

      // db insert operations
      if (sourcesCompanions.isNotEmpty) {
        await _sourcesTable.insertBulkSources(sourcesCompanions);
      }
      if (newsCompanions.isNotEmpty) {
        await _newsTable.insertBulkNews(newsCompanions);
      }

      return pagedArticles;
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
  Stream<NewsEntity> getNewsDetail(String url) {
    return _newsTable.watchNewsWithSource(identifier: url).map((news) {
      return news.toEntity();
    });
  }
}
