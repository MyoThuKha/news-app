import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<void> saveThemeMode(String mode);
  Future<String?> getThemeMode();
}

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
