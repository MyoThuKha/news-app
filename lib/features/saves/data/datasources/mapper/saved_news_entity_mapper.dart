import 'package:news/config/database/app_database.dart';
import 'package:news/features/saves/domain/entities/entities.dart';

extension SavedNewsEntityMapper on SavedNewsEntity {
  SavesTableCompanion toCompanion(String newsId) {
    return SavesTableCompanion.insert(newsId: newsId);
  }
}
