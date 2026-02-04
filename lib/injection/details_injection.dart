import 'package:news/features/news/domain/repositories/news_repository.dart';
import 'package:news/features/news/domain/usecases/get_news_detail_usecase.dart';
import 'package:news/features/news/presentation/bloc/news_details/news_details_bloc.dart';
import 'package:news/injection/injection_container.dart';


Future<void> initDetailDeps() async {
  // Use cases
  sl.registerLazySingleton<GetNewsDetailUseCase>(
    () => GetNewsDetailUseCase(sl<NewsRepository>()),
  );

  // Bloc
  sl.registerFactory(
    () => NewsDetailsBloc(getNewsDetailUseCase: sl<GetNewsDetailUseCase>()),
  );
}

