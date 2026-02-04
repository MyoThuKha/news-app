import 'package:get_it/get_it.dart';
import 'package:news/config/database/app_database.dart';
import 'package:news/features/saves/data/datasources/datasources.dart';
import 'package:news/features/saves/data/repositories/repositories.dart';
import 'package:news/features/saves/domain/repositories/repositories.dart';
import 'package:news/features/saves/domain/usecases/usecases.dart';
import 'package:news/features/saves/presentation/bloc/saved_news/saved_news_bloc.dart';
import 'package:news/features/saves/presentation/bloc/save_status/save_status_bloc.dart';

final sl = GetIt.instance;

Future<void> initSavedNewsDeps() async {

  // Data sources / clients
  sl.registerLazySingleton<SavesDao>(() => SavesDao(sl<AppDatabase>()));

  // Repository
  sl.registerLazySingleton<SavedNewsRepository>(
    () => SavedNewsRepositoryImpl(
      savesDao: sl<SavesDao>(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetSavedNewsUseCase>(
    () => GetSavedNewsUseCase(sl<SavedNewsRepository>()),
  );

  sl.registerLazySingleton<GetSaveStatusUseCase>(
    () => GetSaveStatusUseCase(sl<SavedNewsRepository>()),
  );
  sl.registerLazySingleton<SaveNewsUseCase>(
    () => SaveNewsUseCase(sl<SavedNewsRepository>()),
  );
  sl.registerLazySingleton<DeleteNewsUseCase>(
    () => DeleteNewsUseCase(sl<SavedNewsRepository>()),
  );

  // Bloc
  sl.registerFactory(
    () => SavedNewsBloc(
      getNewsUseCase: sl<GetSavedNewsUseCase>(),
      savesUseCase: sl<SaveNewsUseCase>(),
      deleteUseCase: sl<DeleteNewsUseCase>(),
    ),
  );
  sl.registerFactory(
    () => SaveStatusBloc(
      getStatusUseCase: sl<GetSaveStatusUseCase>(),
      savesUseCase: sl<SaveNewsUseCase>(),
      deleteUseCase: sl<DeleteNewsUseCase>(),
    ),
  );

}

