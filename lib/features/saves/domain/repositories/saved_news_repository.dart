import 'package:news/features/saves/domain/entities/entities.dart';

abstract class SavedNewsRepository {
  Future<void> saveNews(SavedNewsEntity data);
  Future<void> deleteNews(SavedNewsEntity data);
  Stream<List<SavedNewsEntity>> watchSavedNews();
}
