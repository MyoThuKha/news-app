import 'package:news/config/database/app_database.dart';
import 'package:news/features/news/domain/entities/entities.dart';

extension SavedTableMapper on NewsEntity {
  SavesTableCompanion toCompanion(String url) {
    return SavesTableCompanion.insert(newsId: url);
  }
}
