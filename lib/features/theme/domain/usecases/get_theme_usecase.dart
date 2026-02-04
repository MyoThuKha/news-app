import 'package:news/config/themes/app_theme_mode.dart';
import 'package:news/features/theme/domain/repositories/theme_repository.dart';

class GetThemeUseCase {
  GetThemeUseCase(this.repository);
  final ThemeRepository repository;

  Future<AppThemeMode> call() => repository.getThemeMode();
}
