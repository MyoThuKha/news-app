import 'package:news/config/themes/app_theme_mode.dart';
import 'package:news/features/theme/domain/repositories/theme_repository.dart';

class SaveThemeUseCase {
  SaveThemeUseCase(this.repository);
  final ThemeRepository repository;

  Future<void> call(AppThemeMode mode) => repository.saveThemeMode(mode);
}
