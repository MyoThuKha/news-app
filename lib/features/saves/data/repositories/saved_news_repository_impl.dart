import 'package:news/core/domain/entities/entities.dart';
import 'package:news/features/saves/data/datasources/datasources.dart';
import 'package:news/features/saves/data/mappers/saved_news_with_source_mapper.dart';
import 'package:news/features/saves/data/mappers/saved_table_mapper.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';

class SavedNewsRepositoryImpl implements SavedNewsRepository {
  SavedNewsRepositoryImpl({required SavesDao savesDao}) : _savesDao = savesDao;
  late final SavesDao _savesDao;

  @override
  Future<void> saveNews(NewsEntity news) async {
    await _savesDao.saveNews(news.toCompanion(news.url));
  }

  @override
  Future<void> deleteNews(NewsEntity news) async {
    await _savesDao.deleteNews(news.toCompanion(news.url));
  }

  @override
  Stream<List<SavedNewsEntity>> watchSavedNews() {
    return _savesDao.watchSavedNews().map((savedNews) {
      return savedNews.map((news) {
        return news.toSavedNewsEntity();
      }).toList();
    });
  }
  
  @override
  Future<SavedNewsEntity?> getSaveNewsByUrl(String url) async {
    final savedNews = await _savesDao.getSavedNewsByIdentifier(url);
    return savedNews?.toSavedNewsEntity();
  }
}
