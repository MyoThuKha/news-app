import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/data/datasources/local/local.dart';
import 'package:news/features/news/data/datasources/remote/news_api_service.dart';
import 'package:news/features/news/data/mappers/mappers.dart';
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
  Future<void> fetchNews() async {
    try {
      final newsModels = await _newsApiService.fetchNews();

      final List<NewsTableCompanion> newsCompanions = [];
      final List<SourcesTableCompanion> sourcesCompanions = [];

      for (final newsModel in newsModels) {
        String? sourceId = newsModel.source?.identifier;

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
    } catch (_) {}
  }

  @override
  Stream<List<NewsEntity>> getNews() {
    return _newsTable.watchAllNews().map((newsList) {
      return newsList.map((newsTableData) {
        final source = SourceEntity(id: '', name: '');
        return newsTableData.toEntity(source);
      }).toList();
    });
  }
}
