abstract class ThemeLocalDataSource {
  Future<void> saveThemeMode(String mode);
  Future<String?> getThemeMode();
}
