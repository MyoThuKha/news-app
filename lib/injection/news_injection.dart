import 'package:get_it/get_it.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/core/network/dio_client.dart';
import 'package:news/features/news/data/datasources/datasources.dart';
import 'package:news/features/news/data/repositories/news_repository_impl.dart';
import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';
import 'package:news/features/news/presentation/bloc/featured_news/featured_news_bloc.dart';
import 'package:news/features/news/presentation/bloc/news_bloc.dart';
import 'package:news/features/news/presentation/bloc/news_details/news_details_bloc.dart';

final sl = GetIt.instance;

Future<void> initNewsDeps() async {
  // Data sources / clients
  sl.registerLazySingleton<NewsApiService>(
    () => NewsApiServiceImpl(sl<DioClient>()),
  );

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

  sl.registerLazySingleton<FetchFeaturedNewsUseCase>(
    () => FetchFeaturedNewsUseCase(sl<NewsRepository>()),
  );
  sl.registerLazySingleton<GetFeaturedNewsUseCase>(
    () => GetFeaturedNewsUseCase(sl<NewsRepository>()),
  );

  sl.registerLazySingleton<GetNewsDetailUseCase>(
    () => GetNewsDetailUseCase(sl<NewsRepository>()),
  );


  // Bloc
  sl.registerFactory(
    () => NewsBloc(
      fetchNewsUseCase: sl<FetchNewsUseCase>(),
      getNewsUseCase: sl<GetNewsUseCase>(),
    ),
  );
  sl.registerFactory(
    () => FeaturedNewsBloc(
      fetchFeaturedNewsUseCase: sl<FetchFeaturedNewsUseCase>(),
      getFeaturedNewsUseCase: sl<GetFeaturedNewsUseCase>(),
    ),
  );

  // Bloc
  sl.registerFactory(
    () => NewsDetailsBloc(getNewsDetailUseCase: sl<GetNewsDetailUseCase>()),
  );
}
