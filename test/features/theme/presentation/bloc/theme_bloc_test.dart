import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/config/themes/app_theme_mode.dart';
import 'package:news/features/theme/domain/usecases/usecases.dart';
import 'package:news/features/theme/presentation/bloc/theme_bloc.dart';

import 'theme_bloc_test.mocks.dart';

@GenerateMocks([GetThemeUseCase, SaveThemeUseCase])
void main() {
  late MockGetThemeUseCase mockGetTheme;
  late MockSaveThemeUseCase mockSaveTheme;

  setUp(() {
    mockGetTheme = MockGetThemeUseCase();
    mockSaveTheme = MockSaveThemeUseCase();
  });

  group('ThemeBloc', () {
    test('initial state is ThemeState with AppThemeMode.system', () {
      when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.system);

      final themeBloc = ThemeBloc(
        getTheme: mockGetTheme,
        saveTheme: mockSaveTheme,
      );

      expect(themeBloc.state, const ThemeState(AppThemeMode.system));
      themeBloc.close();
    });

    blocTest<ThemeBloc, ThemeState>(
      'emits ThemeState with loaded theme when ThemeLoaded event is added',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.dark);
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) => bloc.add(const ThemeEvent.themeLoaded()),
      expect: () => [const ThemeState(AppThemeMode.dark)],
      verify: (_) {
        verify(mockGetTheme()).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'saves theme when ThemeUpdated event is added with dark mode',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.system);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) => bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.dark)),
      expect: () => [const ThemeState(AppThemeMode.dark)],
      verify: (_) {
        verify(mockSaveTheme(AppThemeMode.dark)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'handles multiple theme updates correctly',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.system);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) =>
          bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.light)),
      expect: () => [const ThemeState(AppThemeMode.light)],
      verify: (_) {
        verify(mockSaveTheme(AppThemeMode.light)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'loads and updates theme in sequence',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.light);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) async {
        bloc.add(const ThemeEvent.themeLoaded());
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.dark));
      },
      expect: () => [
        const ThemeState(AppThemeMode.light),
        const ThemeState(AppThemeMode.dark),
      ],
      verify: (_) {
        verify(mockGetTheme()).called(1);
        verify(mockSaveTheme(AppThemeMode.dark)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'saves theme when ThemeUpdated event is added with system mode',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.light);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) =>
          bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.system)),
      expect: () => [const ThemeState(AppThemeMode.system)],
      verify: (_) {
        verify(mockSaveTheme(AppThemeMode.system)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'handles multiple theme updates correctly',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.system);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) async {
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.light));
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.dark));
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.system));
      },
      expect: () => [
        const ThemeState(AppThemeMode.light),
        const ThemeState(AppThemeMode.dark),
        const ThemeState(AppThemeMode.system),
      ],
      verify: (_) {
        verify(mockSaveTheme(AppThemeMode.light)).called(1);
        verify(mockSaveTheme(AppThemeMode.dark)).called(1);
        verify(mockSaveTheme(AppThemeMode.system)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'handles multiple theme updates correctly',
      setUp: () {
        when(mockGetTheme()).thenAnswer((_) async => AppThemeMode.system);
        when(mockSaveTheme(any)).thenAnswer((_) async {});
      },
      build: () => ThemeBloc(getTheme: mockGetTheme, saveTheme: mockSaveTheme),
      act: (bloc) async {
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.light));
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.dark));
        bloc.add(const ThemeEvent.themeUpdated(AppThemeMode.system));
      },
      expect: () => [
        const ThemeState(AppThemeMode.light),
        const ThemeState(AppThemeMode.dark),
        const ThemeState(AppThemeMode.system),
      ],
      verify: (_) {
        verify(mockSaveTheme(AppThemeMode.light)).called(1);
        verify(mockSaveTheme(AppThemeMode.dark)).called(1);
        verify(mockSaveTheme(AppThemeMode.system)).called(1);
      },
    );
  });
}
