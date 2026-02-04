import 'dart:io';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:get_it/get_it.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/core/network/network_config.dart';
import 'package:news/features/news/data/datasources/datasources.dart';
import 'package:news/features/news/data/repositories/news_repository_impl.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';
import 'package:news/injection/details_injection.dart';
import 'package:news/injection/saves_injection.dart';
import 'package:news/injection/theme_injection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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

  // news local db
  sl.registerLazySingleton<AppDatabase>(() {
    return AppDatabase(
      LazyDatabase(() async {
        final dir = await getApplicationDocumentsDirectory();
        final file = File(p.join(dir.path, 'news.db'));
        return NativeDatabase(file);
      }),
    );
  });

  sl.registerLazySingleton<NewsDao>(() => NewsDao(sl<AppDatabase>()));
  sl.registerLazySingleton<SourcesDao>(() => SourcesDao(sl<AppDatabase>()));

  // Repository
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      newsTable: sl<NewsDao>(),
      sourcesTable: sl<SourcesDao>(),
      newsApiService: sl<NewsApiService>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<FetchNewsUseCase>(
    () => FetchNewsUseCase(sl<NewsRepository>()),
  );
  sl.registerLazySingleton<GetNewsUseCase>(
    () => GetNewsUseCase(sl<NewsRepository>()),
  );

  // Bloc
  sl.registerFactory(
    () => NewsBloc(
      fetchNewsUseCase: sl<FetchNewsUseCase>(),
      getNewsUseCase: sl<GetNewsUseCase>(),
    ),
  );

  await initThemeDeps();
  await initDetailDeps();
  await initSavedNewsDeps();
}
