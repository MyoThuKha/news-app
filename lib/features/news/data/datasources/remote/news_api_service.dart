import 'package:dio/dio.dart';
import 'package:news/core/constants/api_consts.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/features/news/data/mappers/news_model_mapper.dart';
import 'package:news/features/news/data/models/models.dart';
import 'package:news/features/news/domain/entities/paged_articles.dart';

abstract class NewsApiService {
  Future<PagedArticles> fetchNews(int page, {int pageSize = 20});
}

class NewsApiServiceImpl implements NewsApiService {
  NewsApiServiceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<PagedArticles> fetchNews(int page, {int pageSize = 20}) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.topHeadlines,
        queryParameters: {'language': 'en', 'page': page, 'pageSize': pageSize},
      );
      final List<dynamic> articles = response.data['articles'];
      final int totalResults = response.data['totalResults'] ?? 0;

      final newsModels = articles
          .map((json) => NewsModel.fromJson(json))
          .toList();
      final newsEntities = newsModels.map((model) => model.toEntity()).toList();

      return PagedArticles(
        articles: newsEntities,
        totalResults: totalResults,
        page: page,
        pageSize: pageSize,
      );
    } on DioException {
      rethrow;
    }
  }
}
