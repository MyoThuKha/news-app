import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';
import 'package:news/features/news/presentation/bloc/news/news_bloc.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([FetchNewsUseCase, GetNewsUseCase])
void main() {
  group('NewsBloc', () {
    late MockFetchNewsUseCase mockFetchNewsUseCase;
    late MockGetNewsUseCase mockGetNewsUseCase;

    setUp(() {
      mockFetchNewsUseCase = MockFetchNewsUseCase();
      mockGetNewsUseCase = MockGetNewsUseCase();
    });

    test('initial state is _Initial', () {
      final bloc = NewsBloc(
        fetchNewsUseCase: mockFetchNewsUseCase,
        getNewsUseCase: mockGetNewsUseCase,
      );
      expect(bloc.state, equals(const NewsState.initial()));
      bloc.close();
    });

    group('NewsLoaded', () {
      final testNewsList = [
        NewsEntity(
          source: const SourceEntity(id: 'test-id-1', name: 'Test Source 1'),
          author: 'Test Author 1',
          title: 'Test Title 1',
          description: 'Test Description 1',
          url: 'https://example.com/news1',
          urlToImage: 'https://example.com/image1.jpg',
          publishedAt: DateTime.now(),
          content: 'Test Content 1',
          cachedAt: DateTime.now(),
          isFeatured: false,
        ),
        NewsEntity(
          source: const SourceEntity(id: 'test-id-2', name: 'Test Source 2'),
          author: 'Test Author 2',
          title: 'Test Title 2',
          description: 'Test Description 2',
          url: 'https://example.com/news2',
          urlToImage: 'https://example.com/image2.jpg',
          publishedAt: DateTime.now(),
          content: 'Test Content 2',
          cachedAt: DateTime.now(),
          isFeatured: false,
        ),
      ];

      blocTest<NewsBloc, NewsState>(
        'emits loading then success with isCached: false when fetch succeeds',
        setUp: () {
          when(mockFetchNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 1,
              pageSize: 10,
            ),
          );
          when(
            mockGetNewsUseCase.call(any),
          ).thenAnswer((_) => Stream.value(testNewsList));
        },
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.newsLoaded()),
        expect: () => [
          const NewsState.loading(),
          NewsState.success(news: testNewsList, isCached: false),
        ],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
          verify(mockGetNewsUseCase.call(any)).called(1);
        },
      );

      blocTest<NewsBloc, NewsState>(
        'emits loading then success with isCached: true when fetch fails',
        setUp: () {
          when(
            mockFetchNewsUseCase.call(any),
          ).thenThrow(Exception('Network error'));
          when(
            mockGetNewsUseCase.call(any),
          ).thenAnswer((_) => Stream.value(testNewsList));
        },
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.newsLoaded()),
        expect: () => [
          const NewsState.loading(),
          NewsState.success(news: testNewsList, isCached: true),
        ],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
          verify(mockGetNewsUseCase.call(any)).called(1);
        },
      );
    });

    group('NewsRefreshed', () {
      blocTest<NewsBloc, NewsState>(
        'resets page and calls fetchNewsUseCase',
        setUp: () {
          when(mockFetchNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 1,
              pageSize: 10,
            ),
          );
        },
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.newsRefreshed()),
        expect: () => [],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
        },
      );
    });

    group('NewsLoadMore', () {
      final testNewsList = [
        NewsEntity(
          source: const SourceEntity(id: 'test-id-1', name: 'Test Source 1'),
          author: 'Test Author 1',
          title: 'Test Title 1',
          description: 'Test Description 1',
          url: 'https://example.com/news1',
          urlToImage: 'https://example.com/image1.jpg',
          publishedAt: DateTime.now(),
          content: 'Test Content 1',
          cachedAt: DateTime.now(),
          isFeatured: false,
        ),
      ];

      blocTest<NewsBloc, NewsState>(
        'loads more news when hasMore is true and state is success',
        setUp: () {
          when(mockFetchNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 20,
              page: 2,
              pageSize: 10,
            ),
          );
        },
        seed: () => NewsState.success(news: testNewsList),
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.loadMore()),
        expect: () => [
          NewsState.success(news: testNewsList, isMoreLoading: true),
          NewsState.success(news: testNewsList, isMoreLoading: false),
        ],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
        },
      );

      blocTest<NewsBloc, NewsState>(
        'sets hasReachedMax to true when hasMore is false',
        setUp: () {
          when(mockFetchNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 10,
              page: 2,
              pageSize: 10,
            ),
          );
        },
        seed: () => NewsState.success(news: testNewsList),
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.loadMore()),
        expect: () => [
          NewsState.success(news: testNewsList, isMoreLoading: true),
          NewsState.success(news: testNewsList, isMoreLoading: false),
        ],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
        },
      );

      blocTest<NewsBloc, NewsState>(
        'does nothing when state is not success',
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.loadMore()),
        expect: () => [],
        verify: (_) {
          verifyNever(mockFetchNewsUseCase.call(any));
        },
      );

      blocTest<NewsBloc, NewsState>(
        'sets hasReachedMax when already reached max',
        setUp: () {
          when(mockFetchNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 2,
              pageSize: 10,
            ),
          );
        },
        seed: () => NewsState.success(news: testNewsList, hasReachedMax: true),
        build: () => NewsBloc(
          fetchNewsUseCase: mockFetchNewsUseCase,
          getNewsUseCase: mockGetNewsUseCase,
        ),
        act: (bloc) => bloc.add(const NewsEvent.loadMore()),
        expect: () => [
          NewsState.success(
            news: testNewsList,
            hasReachedMax: true,
            isMoreLoading: true,
          ),
          NewsState.success(
            news: testNewsList,
            hasReachedMax: true,
            isMoreLoading: false,
          ),
        ],
        verify: (_) {
          verify(mockFetchNewsUseCase.call(any)).called(1);
        },
      );
    });
  });
}
