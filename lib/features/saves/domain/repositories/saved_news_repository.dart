import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/saves/domain/entities/entities.dart';

abstract class SavedNewsRepository {
  Future<void> saveNews(NewsEntity data);
  Future<void> deleteNews(NewsEntity data);
  Stream<List<SavedNewsEntity>> watchSavedNews();
  Future<SavedNewsEntity?> getSaveNewsByUrl(String url);
}
