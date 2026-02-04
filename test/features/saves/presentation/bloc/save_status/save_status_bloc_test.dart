import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/core/domain/entities/news/news_entity.dart';
import 'package:news/core/domain/entities/source/source_entity.dart';
import 'package:news/features/saves/domain/entities/entities.dart';
import 'package:news/features/saves/domain/usecases/usecases.dart';
import 'package:news/features/saves/presentation/bloc/save_status/save_status_bloc.dart';

import 'save_status_bloc_test.mocks.dart';

@GenerateMocks([GetSaveStatusUseCase, SaveNewsUseCase, DeleteNewsUseCase])
void main() {
  group('SaveStatusBloc', () {
    late MockGetSaveStatusUseCase mockGetStatusUseCase;
    late MockSaveNewsUseCase mockSaveNewsUseCase;
    late MockDeleteNewsUseCase mockDeleteNewsUseCase;
    late SaveStatusBloc saveStatusBloc;

    setUp(() {
      mockGetStatusUseCase = MockGetSaveStatusUseCase();
      mockSaveNewsUseCase = MockSaveNewsUseCase();
      mockDeleteNewsUseCase = MockDeleteNewsUseCase();
      saveStatusBloc = SaveStatusBloc(
        getStatusUseCase: mockGetStatusUseCase,
        savesUseCase: mockSaveNewsUseCase,
        deleteUseCase: mockDeleteNewsUseCase,
      );
    });

    tearDown(() {
      saveStatusBloc.close();
    });

    test('initial state is _Initial', () {
      expect(saveStatusBloc.state, equals(const SavedStatusState.initial()));
    });

    group('SaveStatusLoaded', () {
      const testUrl = 'https://example.com/news';

      blocTest<SaveStatusBloc, SavedStatusState>(
        'emits success state with isSaved: true when news is saved',
        build: () {
          final testNews = NewsEntity(
            source: const SourceEntity(id: 'test-id', name: 'Test Source'),
            author: 'Test Author',
            title: 'Test Title',
            description: 'Test Description',
            url: testUrl,
            urlToImage: 'https://example.com/image.jpg',
            publishedAt: DateTime.now(),
            content: 'Test Content',
            cachedAt: DateTime.now(),
            isFeatured: false,
          );
          when(mockGetStatusUseCase.call(any)).thenAnswer(
            (_) async =>
                SavedNewsEntity(news: testNews, savedAt: DateTime.now()),
          );
          return saveStatusBloc;
        },
        act: (bloc) =>
            bloc.add(const SavedStatusEvent.saveStatusLoaded(url: testUrl)),
        expect: () => [const SavedStatusState.success(isSaved: true)],
      );

      blocTest<SaveStatusBloc, SavedStatusState>(
        'emits success state with isSaved: false when news is not saved',
        build: () {
          when(mockGetStatusUseCase.call(any)).thenAnswer((_) async => null);
          return saveStatusBloc;
        },
        act: (bloc) =>
            bloc.add(const SavedStatusEvent.saveStatusLoaded(url: testUrl)),
        expect: () => [const SavedStatusState.success(isSaved: false)],
      );
    });

    group('SaveAdded', () {
      final testNews = NewsEntity(
        source: const SourceEntity(id: 'test-source-id', name: 'Test Source'),
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: 'https://example.com/test',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Test Content',
        cachedAt: DateTime.now(),
        isFeatured: false,
      );

      blocTest<SaveStatusBloc, SavedStatusState>(
        'emits updated state with isSaved: true when news is added',
        build: () {
          when(mockSaveNewsUseCase.call(any)).thenAnswer((_) async {});
          return saveStatusBloc;
        },
        act: (bloc) => bloc.add(SavedStatusEvent.saveAdded(testNews)),
        expect: () => [const SavedStatusState.updated(isSaved: true)],
        verify: (_) {
          verify(mockSaveNewsUseCase.call(any)).called(1);
        },
      );
    });

    group('SaveRemoved', () {
      final testNews = NewsEntity(
        source: const SourceEntity(id: 'test-source-id', name: 'Test Source'),
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: 'https://example.com/test',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Test Content',
        cachedAt: DateTime.now(),
        isFeatured: false,
      );

      blocTest<SaveStatusBloc, SavedStatusState>(
        'emits updated state with isSaved: false when news is removed',
        build: () {
          when(mockDeleteNewsUseCase.call(any)).thenAnswer((_) async {});
          return saveStatusBloc;
        },
        act: (bloc) => bloc.add(SavedStatusEvent.saveRemoved(testNews)),
        expect: () => [const SavedStatusState.updated(isSaved: false)],
        verify: (_) {
          verify(mockDeleteNewsUseCase.call(any)).called(1);
        },
      );
    });
  });
}
