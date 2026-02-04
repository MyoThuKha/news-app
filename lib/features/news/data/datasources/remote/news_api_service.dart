import 'package:dio/dio.dart';
import 'package:news/core/constants/api_consts.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/features/news/data/models/models.dart';

abstract class NewsApiService {

  Future<PaginatedNewsModel> fetchHeadlineNews(int page, {int pageSize = 10});
  Future<PaginatedNewsModel> fetchNews(int page, {int pageSize = 20});
}

class NewsApiServiceImpl implements NewsApiService {
  NewsApiServiceImpl(this._dioClient);

  final DioClient _dioClient;

    @override
  Future<PaginatedNewsModel> fetchHeadlineNews(
    int page, {
    int pageSize = 1,
  }) async {
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

      return PaginatedNewsModel(
        articles: newsModels,
        totalResults: totalResults,
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<PaginatedNewsModel> fetchNews(int page, {int pageSize = 20}) async {
    try {
      final response = await _dioClient.get(
        ApiConstants.all,
        queryParameters: {
          'q': 'apple',
          'language': 'en',
          'page': page,
          'pageSize': pageSize,
        },
      );
      final List<dynamic> articles = response.data['articles'];
      final int totalResults = response.data['totalResults'] ?? 0;

      final newsModels = articles
          .map((json) => NewsModel.fromJson(json))
          .toList();

      return PaginatedNewsModel(
        articles: newsModels,
        totalResults: totalResults,
      );
    } on DioException {
      rethrow;
    }
  }
}
