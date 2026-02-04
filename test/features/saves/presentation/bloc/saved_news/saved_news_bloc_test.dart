import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/usecases/usecases.dart';
import 'package:news/features/saves/presentation/bloc/saved_news/saved_news_bloc.dart';

import 'saved_news_bloc_test.mocks.dart';

@GenerateMocks([GetSavedNewsUseCase, SaveNewsUseCase, DeleteNewsUseCase])
void main() {
  group('SavedNewsBloc', () {
    late MockGetSavedNewsUseCase mockGetSavedNewsUseCase;
    late MockSaveNewsUseCase mockSaveNewsUseCase;
    late MockDeleteNewsUseCase mockDeleteNewsUseCase;

    setUp(() {
      mockGetSavedNewsUseCase = MockGetSavedNewsUseCase();
      mockSaveNewsUseCase = MockSaveNewsUseCase();
      mockDeleteNewsUseCase = MockDeleteNewsUseCase();
    });

    test('initial state is Initial', () {
      expect(
        SavedNewsBloc(
          getNewsUseCase: mockGetSavedNewsUseCase,
          savesUseCase: mockSaveNewsUseCase,
          deleteUseCase: mockDeleteNewsUseCase,
        ).state,
        equals(const SavedNewsState.initial()),
      );
    });

    group('_SavesLoaded', () {
      final testSavedNews = [
        SavedNewsEntity(
          news: NewsEntity(
            source: const SourceEntity(name: 'Test Source', id: 'source1'),
            author: 'Test Author 1',
            title: 'Test News 1',
            description: 'Description 1',
            url: 'https://example.com/1',
            urlToImage: 'https://example.com/image1.jpg',
            publishedAt: DateTime.now(),
            content: 'Content 1',
            cachedAt: DateTime.now(),
            isFeatured: false,
          ),
          savedAt: DateTime.now(),
        ),
        SavedNewsEntity(
          news: NewsEntity(
            source: const SourceEntity(name: 'Test Source', id: 'source2'),
            author: 'Test Author 2',
            title: 'Test News 2',
            description: 'Description 2',
            url: 'https://example.com/2',
            urlToImage: 'https://example.com/image2.jpg',
            publishedAt: DateTime.now(),
            content: 'Content 2',
            cachedAt: DateTime.now(),
            isFeatured: false,
          ),
          savedAt: DateTime.now(),
        ),
      ];

      blocTest<SavedNewsBloc, SavedNewsState>(
        'emits success state with saved news when stream provides data',
        setUp: () {
          when(
            mockGetSavedNewsUseCase.call(const NoParams()),
          ).thenAnswer((_) => Stream.value(testSavedNews));
        },
        build: () => SavedNewsBloc(
          getNewsUseCase: mockGetSavedNewsUseCase,
          savesUseCase: mockSaveNewsUseCase,
          deleteUseCase: mockDeleteNewsUseCase,
        ),
        act: (bloc) => bloc.add(const SavedNewsEvent.savesLoaded()),
        expect: () => [SavedNewsState.success(news: testSavedNews)],
        verify: (_) {
          verify(mockGetSavedNewsUseCase.call(const NoParams())).called(1);
        },
      );

      blocTest<SavedNewsBloc, SavedNewsState>(
        'emits success state with empty list when stream provides empty data',
        setUp: () {
          when(
            mockGetSavedNewsUseCase.call(const NoParams()),
          ).thenAnswer((_) => Stream.value([]));
        },
        build: () => SavedNewsBloc(
          getNewsUseCase: mockGetSavedNewsUseCase,
          savesUseCase: mockSaveNewsUseCase,
          deleteUseCase: mockDeleteNewsUseCase,
        ),
        act: (bloc) => bloc.add(const SavedNewsEvent.savesLoaded()),
        expect: () => [const SavedNewsState.success(news: [])],
        verify: (_) {
          verify(mockGetSavedNewsUseCase.call(const NoParams())).called(1);
        },
      );

      blocTest<SavedNewsBloc, SavedNewsState>(
        'handles multiple emissions from stream',
        setUp: () {
          when(mockGetSavedNewsUseCase.call(const NoParams())).thenAnswer(
            (_) => Stream.fromIterable([
              [testSavedNews.first],
              testSavedNews,
            ]),
          );
        },
        build: () => SavedNewsBloc(
          getNewsUseCase: mockGetSavedNewsUseCase,
          savesUseCase: mockSaveNewsUseCase,
          deleteUseCase: mockDeleteNewsUseCase,
        ),
        act: (bloc) => bloc.add(const SavedNewsEvent.savesLoaded()),
        expect: () => [
          SavedNewsState.success(news: [testSavedNews.first]),
          SavedNewsState.success(news: testSavedNews),
        ],
        verify: (_) {
          verify(mockGetSavedNewsUseCase.call(const NoParams())).called(1);
        },
      );

      blocTest<SavedNewsBloc, SavedNewsState>(
        'handles stream error gracefully - error is caught by emit.forEach',
        setUp: () {
          when(
            mockGetSavedNewsUseCase.call(const NoParams()),
          ).thenAnswer((_) => Stream.error(Exception('Test error')));
        },
        build: () => SavedNewsBloc(
          getNewsUseCase: mockGetSavedNewsUseCase,
          savesUseCase: mockSaveNewsUseCase,
          deleteUseCase: mockDeleteNewsUseCase,
        ),
        act: (bloc) => bloc.add(const SavedNewsEvent.savesLoaded()),
        expect: () => [],
        verify: (_) {
          verify(mockGetSavedNewsUseCase.call(const NoParams())).called(1);
        },
        errors: () => [
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            'Exception: Test error',
          ),
        ],
      );
    });
  });
}
