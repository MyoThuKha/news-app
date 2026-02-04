import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:news/features/news/domain/entities/entities.dart';
import 'package:news/features/news/domain/usecases/usecases.dart';
import 'package:news/features/news/presentation/bloc/featured_news/featured_news_bloc.dart';

import 'featured_news_bloc_test.mocks.dart';

@GenerateMocks([GetFeaturedNewsUseCase, FetchFeaturedNewsUseCase])
void main() {
  group('FeaturedNewsBloc', () {
    late MockGetFeaturedNewsUseCase mockGetFeaturedNewsUseCase;
    late MockFetchFeaturedNewsUseCase mockFetchFeaturedNewsUseCase;

    setUp(() {
      mockGetFeaturedNewsUseCase = MockGetFeaturedNewsUseCase();
      mockFetchFeaturedNewsUseCase = MockFetchFeaturedNewsUseCase();
    });

    test('initial state is _Initial', () {
      final bloc = FeaturedNewsBloc(
        getFeaturedNewsUseCase: mockGetFeaturedNewsUseCase,
        fetchFeaturedNewsUseCase: mockFetchFeaturedNewsUseCase,
      );
      expect(bloc.state, equals(const FeaturedNewsState.initial()));
      bloc.close();
    });

    group('FeaturedNewsLoaded', () {
      final testNews = NewsEntity(
        source: const SourceEntity(id: 'test-id', name: 'Test Source'),
        author: 'Test Author',
        title: 'Test Title',
        description: 'Test Description',
        url: 'https://example.com/news',
        urlToImage: 'https://example.com/image.jpg',
        publishedAt: DateTime.now(),
        content: 'Test Content',
        cachedAt: DateTime.now(),
        isFeatured: true,
      );

      blocTest<FeaturedNewsBloc, FeaturedNewsState>(
        'emits loading then success with isCached: false when fetch succeeds',
        setUp: () {
          when(mockFetchFeaturedNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 1,
              pageSize: 10,
            ),
          );
          when(
            mockGetFeaturedNewsUseCase.call(any),
          ).thenAnswer((_) => Stream.value(testNews));
        },
        build: () => FeaturedNewsBloc(
          getFeaturedNewsUseCase: mockGetFeaturedNewsUseCase,
          fetchFeaturedNewsUseCase: mockFetchFeaturedNewsUseCase,
        ),
        act: (bloc) => bloc.add(const FeaturedNewsEvent.featuredNewsLoaded()),
        expect: () => [
          const FeaturedNewsState.loading(),
          FeaturedNewsState.success(news: testNews, isCached: false),
        ],
        verify: (_) {
          verify(mockFetchFeaturedNewsUseCase.call(any)).called(1);
          verify(mockGetFeaturedNewsUseCase.call(any)).called(1);
        },
      );

      blocTest<FeaturedNewsBloc, FeaturedNewsState>(
        'emits loading then success with isCached: true when fetch fails',
        setUp: () {
          when(
            mockFetchFeaturedNewsUseCase.call(any),
          ).thenThrow(Exception('Network error'));
          when(
            mockGetFeaturedNewsUseCase.call(any),
          ).thenAnswer((_) => Stream.value(testNews));
        },
        build: () => FeaturedNewsBloc(
          getFeaturedNewsUseCase: mockGetFeaturedNewsUseCase,
          fetchFeaturedNewsUseCase: mockFetchFeaturedNewsUseCase,
        ),
        act: (bloc) => bloc.add(const FeaturedNewsEvent.featuredNewsLoaded()),
        expect: () => [
          const FeaturedNewsState.loading(),
          FeaturedNewsState.success(news: testNews, isCached: true),
        ],
        verify: (_) {
          verify(mockFetchFeaturedNewsUseCase.call(any)).called(1);
          verify(mockGetFeaturedNewsUseCase.call(any)).called(1);
        },
      );

      blocTest<FeaturedNewsBloc, FeaturedNewsState>(
        'emits loading then empty when getFeaturedNews returns null',
        setUp: () {
          when(mockFetchFeaturedNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 1,
              pageSize: 10,
            ),
          );
          when(
            mockGetFeaturedNewsUseCase.call(any),
          ).thenAnswer((_) => Stream.value(null));
        },
        build: () => FeaturedNewsBloc(
          getFeaturedNewsUseCase: mockGetFeaturedNewsUseCase,
          fetchFeaturedNewsUseCase: mockFetchFeaturedNewsUseCase,
        ),
        act: (bloc) => bloc.add(const FeaturedNewsEvent.featuredNewsLoaded()),
        expect: () => [
          const FeaturedNewsState.loading(),
          const FeaturedNewsState.empty(),
        ],
        verify: (_) {
          verify(mockFetchFeaturedNewsUseCase.call(any)).called(1);
          verify(mockGetFeaturedNewsUseCase.call(any)).called(1);
        },
      );
    });

    group('FeaturedNewsRefreshed', () {
      blocTest<FeaturedNewsBloc, FeaturedNewsState>(
        'emits loading when refresh is triggered',
        setUp: () {
          when(mockFetchFeaturedNewsUseCase.call(any)).thenAnswer(
            (_) async => const PaginatedNewsEntity(
              articles: [],
              totalResults: 0,
              page: 1,
              pageSize: 10,
            ),
          );
        },
        build: () => FeaturedNewsBloc(
          getFeaturedNewsUseCase: mockGetFeaturedNewsUseCase,
          fetchFeaturedNewsUseCase: mockFetchFeaturedNewsUseCase,
        ),
        act: (bloc) =>
            bloc.add(const FeaturedNewsEvent.featuredNewsRefreshed()),
        expect: () => [const FeaturedNewsState.loading()],
        verify: (_) {
          verify(mockFetchFeaturedNewsUseCase.call(any)).called(1);
        },
      );
    });
  });
}
