import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news/config/themes/app_theme_mode.dart';
import 'package:news/features/theme/domain/usecases/usecases.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc({
    required GetThemeUseCase getTheme,
    required SaveThemeUseCase saveTheme,
  }) : _getTheme = getTheme,
       _saveTheme = saveTheme,
       super(_ThemeState(AppThemeMode.system)) {
    on<_ThemeLoaded>(_onThemeLoaded);
    on<_ThemeUpdated>(_onThemeUpdated);
  }

  late final GetThemeUseCase _getTheme;
  late final SaveThemeUseCase _saveTheme;

  FutureOr<void> _onThemeLoaded(
    _ThemeLoaded event,
    Emitter<ThemeState> emit,
  ) async {
    final themeMode = await _getTheme();
    emit(_ThemeState(themeMode));
  }

  FutureOr<void> _onThemeUpdated(
    _ThemeUpdated event,
    Emitter<ThemeState> emit,
  ) async {
    await _saveTheme(event.themeMode);
    emit(_ThemeState(event.themeMode));
  }
}
