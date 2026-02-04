import 'package:news/features/saves/data/datasources/datasources.dart';
import 'package:news/features/saves/data/datasources/mapper/saved_news_entity_mapper.dart';
import 'package:news/features/saves/data/datasources/mapper/saved_news_with_source_mapper.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/repositories/saved_news_repository.dart';

class SavedNewsRepositoryImpl implements SavedNewsRepository {
  SavedNewsRepositoryImpl({required SavesDao savesDao}) : _savesDao = savesDao;
  late final SavesDao _savesDao;

  @override
  Future<void> saveNews(SavedNewsEntity data) async {
    await _savesDao.saveNews(data.toCompanion(data.news.url));
  }

  @override
  Future<void> deleteNews(SavedNewsEntity data) async {
    await _savesDao.deleteNews(data.toCompanion(data.news.url));
  }

  @override
  Stream<List<SavedNewsEntity>> watchSavedNews() {
    return _savesDao.watchSavedNews().map((savedNews) {
      return savedNews.map((news) {
        return news.toSavedNewsEntity();
      }).toList();
    });
  }
}
