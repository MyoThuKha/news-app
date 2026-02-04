import 'package:shared_preferences/shared_preferences.dart';
import 'package:news/features/theme/data/datasources/local/theme_datasource.dart';

class ThemeDataSourceImpl implements ThemeLocalDataSource {
  ThemeDataSourceImpl(this.prefs);

  final SharedPreferences prefs;
  static const _key = 'app_theme_mode';

  @override
  Future<void> saveThemeMode(String mode) async =>
      await prefs.setString(_key, mode);

  @override
  Future<String?> getThemeMode() async => prefs.getString(_key);
}
