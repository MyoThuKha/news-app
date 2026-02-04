import 'package:news/features/news/data/models/models.dart';

class PaginatedNewsModel {
  PaginatedNewsModel({required this.articles, required this.totalResults});
  final List<NewsModel> articles;
  final int totalResults;
}
