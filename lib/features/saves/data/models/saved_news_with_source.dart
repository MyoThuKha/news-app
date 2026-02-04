import 'package:news/config/database/app_database.dart';

class SavedNewsWithSource {

  SavedNewsWithSource({
    required this.news,
    required this.source,
    required this.savedAt,
  });
  final NewsTableData news;
  final SourcesTableData? source;
  final DateTime savedAt;
}
