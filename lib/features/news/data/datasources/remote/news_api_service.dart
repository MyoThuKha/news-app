import 'package:dio/dio.dart';
import 'package:news/core/constants/api_consts.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/features/news/data/models/models.dart';

abstract class NewsApiService {
  Future<List<NewsModel>> fetchNews();
}


class NewsApiServiceImpl implements NewsApiService {
  NewsApiServiceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await _dioClient.get(
        ApiConstants.all,
        queryParameters: {'q': 'apple', 'page': 1, 'pageSize': 10},
      );
      final List<dynamic> articles = response.data['articles'];
      return articles.map((json) => NewsModel.fromJson(json)).toList();
    } on DioException {
      rethrow;
    }
  }
}
