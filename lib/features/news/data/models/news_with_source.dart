import 'package:news/config/database/app_database.dart';

class NewsWithSource {
  NewsWithSource({required this.news, this.source});
  final NewsTableData news;
  final SourcesTableData? source;
}
