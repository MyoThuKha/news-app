import 'package:news/config/themes/app_theme_mode.dart';
import 'package:news/features/theme/domain/repositories/theme_repository.dart';
import 'package:news/features/theme/data/datasources/local/theme_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this.local);
  final ThemeLocalDataSource local;

  AppThemeMode _fromString(String? s) {
    if (s == null) return AppThemeMode.system;
    return AppThemeMode.values.firstWhere(
      (e) => e.name == s,
      orElse: () => AppThemeMode.system,
    );
  }

  String _toString(AppThemeMode m) => m.name;

  @override
  Future<AppThemeMode> getThemeMode() async =>
      _fromString(await local.getThemeMode());

  @override
  Future<void> saveThemeMode(AppThemeMode mode) async =>
      local.saveThemeMode(_toString(mode));
}
