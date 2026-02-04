import 'package:get_it/get_it.dart';
import 'package:news/features/theme/data/datasources/datasources.dart';
import 'package:news/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:news/features/theme/data/repositories/theme_repository_impl.dart';
import 'package:news/features/theme/domain/repositories/theme_repository.dart';
import 'package:news/features/theme/domain/usecases/get_theme_usecase.dart';
import 'package:news/features/theme/domain/usecases/save_theme_usecase.dart';

final sl = GetIt.instance;

Future<void> initThemeDeps() async {
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  // Data source
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeDataSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(sl<ThemeLocalDataSource>()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetThemeUseCase(sl<ThemeRepository>()));
  sl.registerLazySingleton(() => SaveThemeUseCase(sl<ThemeRepository>()));

  // Bloc
  sl.registerFactory(
    () => ThemeBloc(
      getTheme: sl<GetThemeUseCase>(),
      saveTheme: sl<SaveThemeUseCase>(),
    ),
  );
}
