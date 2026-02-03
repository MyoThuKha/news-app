import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/core/network/network_config.dart';
import 'package:news/features/news/data/datasources/remote/news_api_service.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {

  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      Dio(
        BaseOptions(
          baseUrl: NetworkConfig.baseUrl,
          connectTimeout: Duration(milliseconds: NetworkConfig.connectTimeout),
          receiveTimeout: Duration(milliseconds: NetworkConfig.receiveTimeout),
          sendTimeout: Duration(milliseconds: NetworkConfig.sendTimeout),
          headers: Map<String, String>.from(NetworkConfig.headers),
        ),
      ),
    ),
  );

  // Data sources / clients

  sl.registerLazySingleton<NewsApiService>(
    () => NewsApiServiceImpl(sl<DioClient>()),
  );



}

