part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.themeLoaded() = _ThemeLoaded;
  const factory ThemeEvent.themeUpdated(AppThemeMode themeMode) = _ThemeUpdated;
}
